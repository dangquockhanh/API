//
//  ViewController.swift
//  AlamofireGetPost
//
//  Created by Đặng Khánh  on 9/13/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    @IBOutlet weak var InfoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getButton(_ sender: UIButton) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let data = response.data {
                do {
                    let posts = try JSONDecoder().decode([Post].self, from: data)
                    DispatchQueue.main.async {
                        self.InfoTextView.text = "\(posts)"
                    }
                    print(posts)
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func postButton(_ sender: UIButton) {
        let parameter = [
            "username": "Dang khanh",
            "messenge": "I'm learning IOS",
            "createdDate": Date().description
        ]
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: [])
        request.httpBody = httpBody
        
        Alamofire.request(request).responseJSON { (response) in
            if let data = response.data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                    let jsonString = String(data: jsonData, encoding: .utf8)
                    
                    DispatchQueue.main.async {
                        self.InfoTextView.text = "\(jsonString!)"
                    }
                } catch {
                    print(error)
                }
            }
        }
    }
}

