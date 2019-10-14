//
//  ViewController.swift
//  firebasenamrata
//
//  Created by Felix 05 on 23/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController {
    var ref: DatabaseReference!
    var courseDic = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseApp.configure()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    @IBOutlet weak var fee: UITextField!
    
    @IBOutlet weak var duration: UITextField!
    
    
    @IBOutlet weak var name: UITextField!
    
    
    
    @IBAction func save(_ sender: UIButton) {
        ref = Database.database().reference()
       courseDic.setValue(name.text!, forKey: "name")
        courseDic.setValue(duration.text!, forKey: "duration")
        courseDic.setValue(fee.text!, forKey: "fee")
        ref.child("courses").childByAutoId().setValue(courseDic) {(error, reference )in
            
            if ((error) != nil)
            {
                print("failed to insert")
            }
            else
            {
                print("insert sucess")
            }
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

