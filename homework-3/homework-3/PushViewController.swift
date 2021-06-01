//
//  PushViewController.swift
//  homework-3
//
//  Created by Vlad on 31.05.2021.
//

import Foundation
import UIKit

class PushViewController: UIViewController, ILoggerProtocol {
    func printState(state: String) {
        print("PushViewController has \(state)")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        printState(state: "appeared")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        printState(state: "disappeared")

    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .blue
    }
}
