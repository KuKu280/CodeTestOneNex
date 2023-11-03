//
//  APIClient.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import Foundation

enum APIError: String, Error {
    case internetConnectionError = "Connection Error!\nPlease check your internet connection."
    case noServerResponse = "Server Error!\nNo response from server.\nPlease contact the support for help."
    case noData = "Server returns no data.\nPlease contact the support for help."
    case jsonError = "Decoding failed!"
    case hostConnectionError = "Transport Error!\nUnable to connect to the host.\nPlease contact the supportfor help."
    case noDataAvailable
    case canNotProcessData
    case Parameterencodingfailed
    case InvalidURL
    case InvalidToken
    case InvalidQueryItem
    case cantNotRetriveToken
    case invalid = "Invalid username or password"
}

class APIClient {
    
    private static func performRequest<T: Decodable>(
        router: APIRouter,
        completion: @escaping (Result<T, Error>
        ) -> Void) {
        
        let urlRequest = try? router.asURLRequest()
        guard let url = urlRequest else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error != nil || data == nil {
                DispatchQueue.main.async {
                    completion(.failure(APIError.hostConnectionError))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.noServerResponse))
                }
                return
            }
            
            guard response.statusCode != 403 else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.invalid))
                }
                return
            }
            
            guard response.statusCode == 200 else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.noServerResponse))
                }
                return
            }
            
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(APIError.noData))
                }
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                debugPrint(json)
                let decoder = JSONDecoder()
                let obj = try decoder.decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(obj))
                }
            } catch {
                DispatchQueue.main.async {
                    debugPrint(error)
                    completion(.failure(APIError.jsonError))
                }
            }
        }.resume()
    }
    
    static func login(
        loginRequest: LoginRequest,
        completion: @escaping (
            Result<LoginResponse, Error>
        ) -> Void) {
        performRequest(
            router: .login(loginRequest),
            completion: completion
        )
    }
}
