//
//  APIRouter.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import Foundation

enum APIRouter: APIConfiguration {

    case login(_ loginRequest: LoginRequest)
    case getArticle
    case getArtcileCategories

    var urlComponents: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "codetest.onenex.dev"
        return urlComponents
    }

    var method: HTTPMethod {
        switch self {
        case .login:
            return .post
        case .getArticle:
            return .get
        case .getArtcileCategories:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .login:
            return "/api/auth/login"
        case .getArticle:
            return "/api/articles"
        case .getArtcileCategories:
            return "/api/articles/categories"
        }
    }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }

    var parameters: Parameters? {
        switch self {
        case .login(let loginRequest):
            return loginRequest.asDictionary
        case .getArticle, .getArtcileCategories:
            return nil
        }
    }

    var isToken: Bool {
        switch self {
        case .login:
            return false
        case .getArticle, .getArtcileCategories:
            return true
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        var urlComponents = self.urlComponents
        urlComponents.path = path
        
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else { throw APIError.InvalidURL }
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = method.rawValue
        
        if isToken {
            guard let token = UserDefaults.standard.string(forKey: "Token") else {
                throw APIError.cantNotRetriveToken
            }
            urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        if let parameters = parameters {
            urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
            guard let httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: []) else { throw APIError.canNotProcessData }
            urlRequest.httpBody = httpBody
        }
        debugPrint(urlRequest)
        return urlRequest
    }
    
}
