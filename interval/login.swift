//
//  login.swift
//  interval
//
//  Created by 笹倉一也 on 2020/08/13.
//  Copyright © 2020 笹倉一也. All rights reserved.
//

import UIKit
import FirebaseAuth

class login: UIViewController {

    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var pass: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
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
    
}
