//
//  login.swift
//  interval
//
//  Created by 笹倉一也 on 2020/08/13.
//  Copyright © 2020 笹倉一也. All rights reserved.
//

import UIKit
import FirebaseAuth

class login: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        キーボード閉じる用
        email.delegate = self
        pass.delegate = self
        
    }
    
    
    @IBAction func login(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: email.text!, password: pass.text!) { [weak self] authResult, error in
            guard self != nil else { return }
            
        
        }
        print("sign in success!!")
    }
    
    @IBAction func logout(_ sender: Any) {
        let firebaseAuth = Auth.auth()
        do {
          try firebaseAuth.signOut()
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
    
    }
    
    
    //    別のところタップでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           email.resignFirstResponder()
           pass.resignFirstResponder()
                  
       }
    
    
}
