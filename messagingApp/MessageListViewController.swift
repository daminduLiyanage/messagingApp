//
//  ViewController.swift
//  messagingApp
//
//  Created by Damindu Liyanage on 2018-05-24.
//  Copyright © 2018 d7. All rights reserved.
//

import UIKit
import Firebase

class MessageListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var messageListTableView: UITableView!
    var messages: [String] = []
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        messageListTableView.delegate = self
        messageListTableView.dataSource = self
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ref = Database.database().reference()
        
        ref.child("messages").observe(DataEventType.value, with: { (snapshot) in
            self.messages.removeAll()
            
            let dictionary = snapshot.value as? [String: Any] // any string to object any, fills dictionary
            
            dictionary?.forEach({ (arg) in
                let (_, value) = arg
                self.messages.append(value as! String)
            })
            
            self.messageListTableView.reloadData()
   
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addPressed(_ sender: Any) {
        let messageEditorScene = self.storyboard?.instantiateViewController(withIdentifier: "messageEditer")
        present(messageEditorScene!, animated: true, completion:nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageList", for: indexPath)
        cell.textLabel?.text = messages[indexPath.row]
        return cell
    }
}

