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

final class Registered: Codable {
    var regDate = String()
    
    enum CodingKeys: String, CodingKey {
        case regDate = "date"
        
    }
}

final class Login: Codable {
    var username = String()
    
    enum CodingKeys: String, CodingKey {
        case username
    }
}

final class DateOfBirth: Codable {
    var dateOfBirth = String()
    
    enum CodingKeys: String, CodingKey {
        case dateOfBirth = "date"
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
    var name = Names()
    var location = Location()
    var picture = AvatarURL()
    var dateOfBirth = DateOfBirth()
    var username = Login()
    var gender = String()
    var phone = String()
    var cell = String()
    var email = String()
    var registrationDate = Registered()
    
    enum CodingKeys: String, CodingKey {
        case name, location
        case picture
        case dateOfBirth = "dob"
        case username = "login"
        case gender
        case phone, cell
        case email
        case registrationDate = "registered"
    }
}
