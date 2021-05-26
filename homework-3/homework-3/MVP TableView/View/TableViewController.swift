//
//  TableViewController.swift
//  homework-3
//
//  Created by Vlad on 22.05.2021.
//

import UIKit

class TableViewController: UITableViewController {
    
    var cellsCountHandler: (() -> Int)?
    
    var cellWillShowHandler: ((ITableViewCellView, Int) -> Void)?
    var presenter: TableViewControllerPresenter?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = TableViewControllerPresenter(view: self)
        tableView.rowHeight = 100
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.cellsCountHandler?() ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.tittleLabel.text = "Леша"
        cell.cellTextLabel.text = "Говноед"
        
        return cell
    }
  
}

extension TableViewController: ITableVC {

    
    func update() {
        self.tableView.reloadData()
        
    }
    
    
}
