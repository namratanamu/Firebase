//
//  nextViewController.swift
//  firebasenamrata
//
//  Created by Felix 05 on 23/09/19.
//  Copyright © 2019 felix. All rights reserved.
//

import UIKit
import Firebase

class nextViewController: UIViewController {

    var nameArray = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
     
        var reference:DatabaseReference
        reference = Database.database().reference()
        
        reference.observeSingleEvent(of: .value, with: { (snapshot) in
            let dic = snapshot.value as! NSDictionary
            let mainDic = dic["courses"]  as! NSDictionary
            let allkeysArray = mainDic.allKeys
            
            for key in allkeysArray
            {
                let finalDic = mainDic[key] as! [String:Any]
                let nameStr = finalDic["name"] as! String
                self.nameArray.append(nameStr)
                
            }
            
            
            
            
            print(self.nameArray)
            
            
            
            
        })
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
