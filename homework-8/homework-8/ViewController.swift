//
//  ViewController.swift
//  homework-8
//
//  Created by Vlad on 09.06.2021.
//

import UIKit
import SnapKit

protocol IEmployeListDelegate {
    func passPresenter(presenter: IPresenter, selectedIndex: IndexPath, companyName: String)
}

class ViewController: UIViewController {
    
    var employesSreenDelegate: IEmployeListDelegate?
    var tableView : UITableView?
    var navigationBar: UINavigationBar?
    var presenter: IPresenter = Presenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        tableView = UITableView()
        initTableView()
        initNavigationBar()
    }
    
    func initNavigationBar() {
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: self, action: #selector(addCompany))
        navigationItem.rightBarButtonItem = addItem
        navigationItem.title = "Компании"
    }
    
    func initTableView() {
        view.addSubview(tableView ?? UITableView())
        tableView?.backgroundColor = .blue
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView?.snp.makeConstraints { constraint in
            constraint.top.equalToSuperview().offset(100)
            constraint.width.equalToSuperview()
            constraint.height.equalToSuperview()
        }
    }
    
    @objc func addCompany() {
        let alertController = UIAlertController(title: "Добавить компанию", message: "Добавь новую компанию", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Добавить", style: .default) { action in
            let textField = alertController.textFields?[0]
            self.presenter.addCompany(companyName: textField?.text ?? "")
            self.tableView?.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Отменить", style: .default, handler: nil)
        alertController.addTextField {
            textField in
        }
        alertController.addAction(addAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emplyeeList = EmployeListViewController()
        self.employesSreenDelegate = emplyeeList
        let companyName = tableView.cellForRow(at: indexPath)?.textLabel?.text ?? "Рога и копыта"
        employesSreenDelegate?.passPresenter(presenter: presenter, selectedIndex: indexPath, companyName: companyName)
        self.navigationController?.pushViewController(emplyeeList, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { _, _, complete in
            self.presenter.deleteCompany(companyName: (tableView.cellForRow(at: indexPath)?.textLabel?.text)!)
            tableView.reloadData()
            complete(true)
        }
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = true
        return configuration
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCountOfCompanies()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = presenter.getCompany(indexPath: indexPath)
        return cell
    }
    
    
}

