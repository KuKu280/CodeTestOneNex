//
//  LoginRequest.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import Foundation

struct LoginRequest: Codable {
    let email: String
    let password: String
}

extension LoginRequest: DictionaryConvertible {
    var keyMappingDict: [String: String] {
        [
            "email": "email",
            "password": "password"
        ]
    }
}
