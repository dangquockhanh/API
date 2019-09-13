//
//  ViewController.swift
//  DemoAlamofireImage
//
//  Created by Đặng Khánh  on 9/11/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class ViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://hinhanhdep.org/wp-content/uploads/2016/08/songoku-super-saiyan-cap-3.png").responseImage { response in
            debugPrint(response)
            debugPrint(response.result)
            if let image = response.result.value {
//                print("image downloaded: \(image)")
                DispatchQueue.main.async {
                    self.photoImageView.image = image
                }
            }
        }
    }
}
