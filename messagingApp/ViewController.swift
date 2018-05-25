//
//  ViewController.swift
//  messagingApp
//
//  Created by Damindu Liyanage on 2018-05-24.
//  Copyright © 2018 d7. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    @IBAction func loginPressed(_ sender: Any) {
        let messageListScene = self.storyboard?.instantiateViewController(withIdentifier: "messageList")
        present(messageListScene!, animated: true, completion:nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

