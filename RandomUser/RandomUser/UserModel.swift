//
//  UserModel.swift
//  RandomUser
//
//  Created by Arsenkin Bogdan on 07.03.2020.
//  Copyright © 2020 Arsenkin Bogdan. All rights reserved.
//

import UIKit

final class Users: Codable {
    var results = [UserModel]()
}

final class Names: Codable {
    var firstName = String()
    var lastName = String()
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
}

final class Location: Codable {
    var city = String()
    var state = String()
    
    enum CodingKeys: String, CodingKey {
        case city, state
    }
}

final class AvatarURL: Codable {
    var avatarURL = String()
    
    enum CodingKeys: String, CodingKey {
        case avatarURL = "large"
    }
}

final class UserModel: Codable {
//    var firstName = String()
//    var lastName = String()
//    var avatarURL = String()
//    var city = String()
//    var state = String()
    var name = Names()
    var location = Location()
    var picture = AvatarURL()
    
    enum CodingKeys: String, CodingKey {
        case name, location
        case picture
    }
}
