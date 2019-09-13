//
//  ViewController.swift
//  NetworkingURLSession
//
//  Created by Đặng Khánh  on 9/12/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getButton(_ sender: UIButton) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
        
        URLSession.shared.dataTask(with: url) {[weak self] (data, responese, error) in
            if let data = data {
                do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                    let jsonString = String(data: data, encoding: .utf8)
                    DispatchQueue.main.async {
                           self?.textView.text = jsonString
                    }
                 
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    @IBAction func postButton(_ sender: UIButton) {
        
        let parameter = [
            "username": "Dang Khanh",
            "messenger": "I'm learning IOS",
            "creatDate": Date().description
            
        ]
        
         guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else { return }
            var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let httpBody = try? JSONSerialization.data(withJSONObject: parameter, options: [])
        request.httpBody = httpBody
        
        URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    let jsonData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                    let jsonString = String(data: jsonData, encoding: .utf8)
                    DispatchQueue.main.sync {
                        self?.textView.text = jsonString
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
}


