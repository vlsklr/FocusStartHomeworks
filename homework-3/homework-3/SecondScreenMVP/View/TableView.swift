//
//  TableView.swift
//  homework-3
//
//  Created by user188734 on 5/22/21.
//

import UIKit

class TableView: UITableView, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell() as! CustomTableViewCell
        cell.textLabel?.text = "123"
        cell.textLabel?.textColor = .black
        return cell
    }
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
