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

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var item:[String] = ["１セット目","２セット目","３セット目","４セット目","５セット目","６セット目","７セット目","８セット目","９セット目","１０セット目",]
    var count = 0
    
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

            self.count = setcount as! Int

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

    
    
//    ここからテーブルコード
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
             
        cell.textLabel!.text = item[indexPath.row]
              
        return cell
    
    
    
    }
    
    
    

}

