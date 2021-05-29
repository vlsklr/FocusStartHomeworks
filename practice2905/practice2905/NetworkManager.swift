//
//  NetworkManager.swift
//  practice2905
//
//  Created by Vlad on 29.05.2021.
//

import Foundation

public protocol INetworkMannager
{
    func load(completion: @escaping (Result<(String, String), Error>) -> Void)
    func loadCatImage(code: String, completion: @escaping (Result<Data, Error>) -> Void)
}

struct Facts: Decodable {
    let result: String
    
    enum CodingKeys: String, CodingKey
    {
        case text
    }
    
    init(from decoder: Decoder) {
        let container = try! decoder.container(keyedBy: CodingKeys.self)
        self.result = try! container.decode(String.self, forKey: .text)
    }
}

final class NetworkManager: INetworkMannager
{
    func loadCatImage(code: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let url = URL(string: "https://http.cat/\(code)")! //ТАК ДЕЛАТЬ НЕЛЬЗЯ !!!
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
    
    
    func load(completion: @escaping (Result<(String, String), Error>) -> Void) {
        
        let url = URL(string: "https://cat-fact.herokuapp.com/facts/random")! //ТАК ДЕЛАТЬ НЕЛЬЗЯ !!!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            if let response = response as? HTTPURLResponse {
                if let data = data {
                    if let result = try? JSONDecoder().decode(Facts.self, from: data) {
                        print("RESULT IS \(result)")
                        completion(.success(("\(response.statusCode)","\(result)")))
                    }
                }
            }
        }.resume()
    }
    
}
