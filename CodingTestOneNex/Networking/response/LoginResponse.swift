//
//  LoginResponse.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import Foundation

struct LoginResponse: Codable {
    let message: String?
    let data: LoginData?
    
    struct LoginData: Codable {
        let accessToken: String?
        
        enum CodingKeys: String, CodingKey {
            case accessToken = "access_token"
        }
    }
}
