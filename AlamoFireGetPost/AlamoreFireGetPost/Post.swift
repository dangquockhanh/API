//
//  Post.swift
//  AlamofireGetPost
//
//  Created by Đặng Khánh  on 9/13/19.
//  Copyright © 2019 DangKhanh. All rights reserved.
//

import Foundation

struct Post: Decodable {
    var userId: Int
    var id: Int
    var title: String
    var body: String
}
