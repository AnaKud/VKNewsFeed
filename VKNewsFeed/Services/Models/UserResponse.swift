//
//  UserResponse.swift
//  VKNewsFeed
//
//  Created by Анастасия Кудашева on 21.10.2020.
//  Copyright © 2020 Анастасия Кудашева. All rights reserved.
//

import Foundation

struct  UserResponseWrapped: Decodable {
    let response: [UserResponse]
}

struct UserResponse: Decodable {
    let photo100: String?
    let firstName: String
    let lastName: String
}
