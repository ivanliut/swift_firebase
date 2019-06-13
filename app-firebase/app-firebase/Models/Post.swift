//
//  Post.swift
//  app-firebase
//
//  Created by administrator on 6/13/19.
//  Copyright © 2019 administrator. All rights reserved.
//

import Foundation

struct Post {
    let imageUrl: String
    
    init(dictionary: [String: Any]) {
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
    }
    
}
