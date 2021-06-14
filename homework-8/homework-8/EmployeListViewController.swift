//
//  EmployeListViewController.swift
//  homework-8
//
//  Created by Vlad on 13.06.2021.
//

import UIKit
import SnapKit

protocol IEmployeDelegate {
    func passPresenter(presenter: IPresenter, employee: EmployeeModel?, companyName: String)
}


class EmployeListViewController: UIViewController {
    
    var tableView : UITableView?
    var presenter: IPresenter?
    var indexOfCompany: IndexPath?
    var companyName: String?
    var delegate: IEmployeDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView = UITableView()
        initTableView()
        initNavigationBar()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView?.reloadData()
    }
    
    func initNavigationBar() {
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addWorker))
        navigationItem.rightBarButtonItem = addItem
        navigationItem.title = companyName
    }
    
    @objc func addWorker() {
        
        let employeInfo = EmployeViewController()
        self.delegate = employeInfo
        self.delegate?.passPresenter(presenter: self.presenter as! IPresenter, employee: nil, companyName: companyName!)
        self.navigationController?.pushViewController(employeInfo, animated: true)
        
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

extension EmployeListViewController: IEmployeListDelegate {
    func passPresenter(presenter: IPresenter, selectedIndex: IndexPath, companyName: String) {
        self.presenter = presenter
        self.indexOfCompany = selectedIndex
        self.companyName = companyName
    }
}

extension EmployeListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let employeInfo = EmployeViewController()
        self.delegate = employeInfo
        let employee = presenter?.getEmployee(indexCompany: indexOfCompany!, indexPath: indexPath)
        let employeeModel = EmployeeModel(name: employee?.name ?? "", age: employee?.age, education: employee?.education, experince: employee?.experience, position: employee?.position)
        delegate?.passPresenter(presenter: self.presenter!, employee: employeeModel, companyName: companyName ?? "Рога и копыта")
        self.navigationController?.pushViewController(employeInfo, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            self.presenter?.deleteEmployee(employeeName: (tableView.cellForRow(at: indexPath)?.textLabel?.text)!)
            tableView.reloadData()
            complete(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}

extension EmployeListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCountOfEmplyees(indexPath: indexOfCompany ?? IndexPath()) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let person = presenter?.getEmployee(indexCompany: indexOfCompany ?? IndexPath(), indexPath: indexPath)
        cell.textLabel?.text = person?.name
        return cell
    }
}
