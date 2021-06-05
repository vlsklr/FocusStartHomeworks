//
//  NetworkManager.swift
//  homework-7
//
//  Created by user188734 on 6/5/21.
//

import Foundation

class NetworkManager {
    
    
        func loadImage(urlString: String, completion: @escaping (Result<Data, Error>) -> Void) {
            
            guard let url = URL(string: urlString) else {
                return
            }
            var request = URLRequest(url: url)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { data, _, error in
                if let error = error {
                    completion(.failure(error))
                }
                if let data = data {
                    completion(.success(data))
                }
            }.resume()
        }
    
}
