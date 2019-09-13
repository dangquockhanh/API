//
//  ViewController.swift
//  ParseJson
//
//  Created by Đặng Khánh  on 9/13/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var infoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getButton(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let data = data {
                do {
                    //cách 1 parse dữ liệu. bên phần Model.swift sẽ thêm Decodable vào sau Post
                    let dataJson = try JSONDecoder().decode([Post].self, from: data)
                    
                    // cách 2: parse dữ liệu hiển thị lên textView. bên phần Model.swift sẽ không cần Decodable
//                    var posts = [Post]()
//                    guard let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] else { return }
//                    for object in jsonObject {
//                        let body = object["body"] as? String ?? ""
//                        let title = object["title"] as? String ?? ""
//                        let id = object["id"] as? Int ?? 0
//                        let userID = object["userId"] as? Int ?? 0
//
//                        let post = Post(userID: userID, id: id, title: title, body: body)
//                        posts.append(post)
//
//                        DispatchQueue.main.sync {
//                            self.infoTextView.text = "\(posts)"
//                        }
//                    }
                    DispatchQueue.main.sync {
                        self.infoTextView.text = "\(dataJson)"
                    }
                    print(dataJson)
                    
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func postButton(_ sender: UIButton) {
        
    }
    
}

