//
//  APIManager.swift
//  PerOnBoarding
//
//  Created by Seo Jae Hoon on 2023/02/18.
//

import Foundation

enum HttpMethod {
    static let get = "GET"
    static let post = "POST"
}

final class APIService {
    
    static let shared = APIService()
    
    private init() { }
    
    private let session = URLSession.shared
    
    func request(completion: @escaping (Result<String, APIError>) -> Void) {
        
        guard let url = URL(string: Endpoint.random.getURL) else { return }
        
        var component = URLComponents()
        component.queryItems = Endpoint.random.parameter
        
        let body = component.query?.data(using: .utf8)
        
        let request = createHttpRequest(of: url, httpMethod: HttpMethod.get)
        
        session.dataTask(with: request) { data, response, error in
            
            guard error == nil else {
                completion(.failure(.failedRequest))
                return
            }
            
            guard let response = response as? HTTPURLResponse, (200 ..< 300) ~= response.statusCode else {
                completion(.failure(.invalidResponse))
                return
            }
            
            guard data != nil else {
                completion(.failure(.noData))
                return
            }
            
            completion(.success("ok"))
            
        }.resume()
    }
    
    private func createHttpRequest(
        of url: URL,
        httpMethod: String,
        with headers: [String: String]? = nil,
        with body: Data? = nil
    ) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = httpMethod
        headers?.forEach({ header in
            request.addValue(header.value, forHTTPHeaderField: header.key)
        })
        if let body = body {
            request.httpBody = body
        }
        
        return request
    }

    
}
