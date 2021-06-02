//
//  PushViewController.swift
//  homework-3
//
//  Created by Vlad on 31.05.2021.
//

import Foundation
import UIKit

class PushViewController: UITableViewController, ILoggerProtocol {
    
    let quotes = [
        "Нужно бежать со всех ног, чтобы только оставаться на месте, а чтобы куда-то попасть, надо бежать как минимум вдвое быстрее!",
        "Во всем есть своя мораль, нужно только уметь ее найти!",
        "Знаешь, одна из самых серьезных потерь в битве — это потеря головы.",
        "Завтра никогда не бывает сегодня! Разве можно проснуться поутру и сказать: «Ну вот, сейчас наконец завтра»?"
    ]
    
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
        return quotes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = quotes[indexPath.row]
        cell.textLabel?.numberOfLines = 0
        return cell
        
    }
}
