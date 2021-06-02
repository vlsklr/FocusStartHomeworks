//
//  PushViewController.swift
//  homework-3
//
//  Created by Vlad on 31.05.2021.
//

import Foundation
import UIKit

class PushViewController: UITableViewController, ILoggerProtocol {
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
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "123"
        return cell
        
    }
}
