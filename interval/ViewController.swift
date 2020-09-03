//
//  ViewController.swift
//  interval
//
//  Created by 笹倉一也 on 2020/08/03.
//  Copyright © 2020 笹倉一也. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var setName: UILabel!
    @IBOutlet weak var interval: UILabel!
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
//        正しいユーザーを取得
        let currentUser = Auth.auth().currentUser
        
//        ログイン情報をプリント
        print("あなたのメールアドレス \(String(describing: currentUser?.email!))")
        print("あなたのuid \(String(describing: currentUser?.uid))")
        
        
//        firestore初期化
        let db = Firestore.firestore()
        

//        setをdocRefに格納
        let docRef = db.collection(currentUser!.uid).document("set")

        
//     リアルタイムでデータを取得
        docRef.addSnapshotListener { documentSnapshot, error in
          guard let document = documentSnapshot else {
            print("Error fetching document: \(error!)")
            return
          }
          guard let data = document.data() else {
            print("Document data was empty.")
            return
          }
//            セットネーム、カウント、インターバルを格納
            let setname = document["setname"]
            let setcount = document["setcount"]
            let interval = document["interval"]
            
//            プリントテスト
            print("セットネーム：\(setname!)")
            print("セット数：\(setcount!)")
            print("インターバル：\(interval!)")
            
            let num1:Int = interval as! Int
            let sNum1:String = String(num1)
            
            self.setName.text = setname as? String
            self.interval.text = sNum1 as? String
        
        }
        
    }
    
    
    
    @IBAction func start(_ sender: Any) {
    }
    

}

