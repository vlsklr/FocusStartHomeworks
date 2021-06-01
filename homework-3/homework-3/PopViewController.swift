//
//  PopViewController.swift
//  homework-3
//
//  Created by Vlad on 31.05.2021.
//

import Foundation
import UIKit

class PopViewController: UIViewController, ILoggerProtocol {
    func printState(state: String) {
        print("PopViewController has \(state)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        printState(state: "appeared")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        printState(state: "disappeared")

    }
    override func viewDidLoad() {
        self.view.backgroundColor = .systemRed
    }
    
}
