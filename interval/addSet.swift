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

class addSet: UIViewController,UITextFieldDelegate {

    
    @IBOutlet weak var setnameTF: UITextField!
    @IBOutlet weak var interval: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        キーボード閉じる
        setnameTF.delegate = self
        interval.delegate = self
        
        
    }
    
    @IBAction func save(_ sender: Any) {

        //CurrentUser
        let db = Firestore.firestore()
        let currentUser = Auth.auth().currentUser
        
        // intervalをintに変更
        let intervalcount:String = interval.text!
        let nSinterval:Int = Int(intervalcount)!
              
//        name,setcout,intervalをfirebaseに追加
        db.collection(currentUser!.uid).document("set").setData([
            "setname": setnameTF.text!,
            "interval": nSinterval
        ]) { err in
            if let err = err {
                print("Error writing document: \(err)")
            } else {
                print("Document successfully written!")
              
            }
//        ルートに戻る
            self.dismiss(animated: true, completion: nil)

        }

    }
    
    
    @IBAction func cancel(_ sender: Any) {
//        戻るボタン
        dismiss(animated: true, completion: nil)
    }
 
//    別のところタップでキーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
           setnameTF.resignFirstResponder()
           interval.resignFirstResponder()
                  
       }
    
}
