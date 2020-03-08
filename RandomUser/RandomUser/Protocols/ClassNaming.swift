//
//  ClassNaming.swift
//  RandomUser
//
//  Created by Arsenkin Bogdan on 07.03.2020.
//  Copyright © 2020 Arsenkin Bogdan. All rights reserved.
//

import Foundation

protocol ClassNaming {
    static var classNaming: String { get }
}

extension ClassNaming {
    static var classNaming: String {
        return String(describing: Self.self)
    }
}
