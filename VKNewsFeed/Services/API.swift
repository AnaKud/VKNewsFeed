//
//  API.swift
//  VKNewsFeed
//
//  Created by Анастасия Кудашева on 15.09.2020.
//  Copyright © 2020 Анастасия Кудашева. All rights reserved.
//

import Foundation

struct API {
    static let scheme = "https"
    static let host = "api.vk.com"
    static let version = "5.124"
    
    static let newsFeed = "/method/newsfeed.get"
    
    static let user = "/method/users.get"
}
