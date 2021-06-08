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
    
    private lazy var backgroundSession: URLSession = {
        let config = URLSessionConfiguration.background(withIdentifier: "downloadSomething")
        return URLSession(configuration: config, delegate: self, delegateQueue: nil)
    }()
    
    
    
    func loadImage(url: URL) {
            downloadTask = backgroundSession.downloadTask(with: url)
            downloadTask.countOfBytesClientExpectsToSend = 512
            downloadTask.countOfBytesClientExpectsToReceive = 100 * 1024 * 10 // 10MB
            downloadTask.resume()
        
    }
}

extension NetworkManager: URLSessionDelegate {
    func urlSessionDidFinishEvents(forBackgroundURLSession session: URLSession) {
        DispatchQueue.main.async {
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let completionHandler = appDelegate.backgroundSessionCompletionHandler else { return }
            appDelegate.backgroundSessionCompletionHandler = nil
            completionHandler()
        }
    }
}

extension NetworkManager: URLSessionDownloadDelegate {
    func urlSession(_ session: URLSession, downloadTask: URLSessionDownloadTask, didFinishDownloadingTo location: URL) {
   
        DispatchQueue.main.async {
            self.fileLocation?(location)
        }
    }
    
    
}
