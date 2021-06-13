//
//  EmployeListViewController.swift
//  homework-8
//
//  Created by Vlad on 13.06.2021.
//

import UIKit

class EmployeListViewController: UIViewController {

    var tableView : UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        initTableView()

        // Do any additional setup after loading the view.
    }
    
    func initTableView() {
        self.view.addSubview(tableView ?? UITableView())
        tableView?.backgroundColor = .blue
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.snp.makeConstraints { constraint in
            constraint.top.equalToSuperview().offset(100)
            constraint.width.equalToSuperview()
            constraint.height.equalToSuperview()
        }
    }
}

extension EmployeListViewController: UITableViewDelegate {
    
}

extension EmployeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "228"
        return cell
    }
    
        
}
