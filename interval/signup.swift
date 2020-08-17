//
//  signup.swift
//  interval
//
//  Created by 笹倉一也 on 2020/08/13.
//  Copyright © 2020 笹倉一也. All rights reserved.
//

import UIKit
import FirebaseAuth

class signup: UIViewController {

    
    @IBOutlet weak var signupTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    
    @IBAction func signup(_ sender: Any) {
        
        Auth.auth().createUser(withEmail: signupTF.text!, password: passTF.text!) { authResult, error in
          
        }
    }
    

}
