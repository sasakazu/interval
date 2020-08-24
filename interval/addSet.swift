//
//  addSet.swift
//  interval
//
//  Created by 笹倉一也 on 2020/08/10.
//  Copyright © 2020 笹倉一也. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore

class addSet: UIViewController {

    
    @IBOutlet weak var setnameTF: UITextField!
    @IBOutlet weak var setCount: UILabel!
    @IBOutlet weak var intervalCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let currentUser = Auth.auth().currentUser
        
    }
    
    @IBAction func save(_ sender: Any) {
        
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser
        
        db.collection(currentUser!.uid).document("set").setData([
            "setname": setnameTF.text!,
            "setcount": "CA",
            "interval": "USA"
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
            }
        }
    }
    
    
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
