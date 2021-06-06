//
//  NetworkManager.swift
//  homework-7
//
//  Created by user188734 on 6/5/21.
//

import Foundation
import UIKit

class NetworkManager: NSObject {
    var downloadTask: URLSessionDownloadTask!
    var fileLocation: ((URL) -> ())?
    
    private lazy var bgSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "downloadSomething")
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    
    
    func loadImage(urlString: String) {
        if let url = URL(string: urlString) {
            downloadTask = bgSession.downloadTask(with: url)
            downloadTask.earliestBeginDate = Date().addingTimeInterval(1)
            downloadTask.countOfBytesClientExpectsToSend = 512
            downloadTask.countOfBytesClientExpectsToReceive = 100 * 1024 * 10 // 10MB
            downloadTask.resume()
        }
        
        //            guard let url = URL(string: urlString) else {
        //                return
        //            }
        //            var request = URLRequest(url: url)
        //            request.httpMethod = "GET"
        //
        //            URLSession.shared.dataTask(with: request) { data, _, error in
        //                if let error = error {
        //                    completion(.failure(error))
        //                }
        //                if let data = data {
        //                    DispatchQueue.main.async {
        //
        //
        //                    completion(.success(data))
        //                    }
        //                }
        //            }.resume()
    }
}

extension NetworkManager: URLSessionDelegate {
    
}

extension NetworkManager: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
        
    }
    
    
}
