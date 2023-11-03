//
//  ArticleResponse.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import Foundation

struct ArticleResponse: Codable {
    let message: String?
    let data: [String: Article]
}

struct Article: Codable {
    let id: Int?
    let title: String?
    let content: String?
    let name: String?
}
