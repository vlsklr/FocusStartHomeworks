//
//  ViewController.swift
//  homework-8
//
//  Created by Vlad on 09.06.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var tableView : UITableView?
    var navigationBar: UINavigationBar?
    
    var tempArr = [Company]()
    
    let coreManager = CoreDataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tempArr = coreManager.fetchData()
        tableView = UITableView()
        initTableView()
        initNavigationBar()
        
    }
    
    func initNavigationBar() {
        navigationBar = UINavigationBar()
        self.view.addSubview(navigationBar!);
        navigationBar?.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.width.equalToSuperview()
            make.height.equalTo(44)
        }
        let navItem = UINavigationItem(title: "Компании")
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.add, target: nil, action: #selector(addCompany));
        navItem.rightBarButtonItem = addItem;
        navigationBar?.setItems([navItem], animated: false);
    }
    
    func initTableView() {
        view.addSubview(tableView ?? UITableView())
        tableView?.backgroundColor = .blue
        tableView?.delegate = self
        tableView?.dataSource = self
        //tableView?.register(DownloadedCell.self, forCellReuseIdentifier: "cell")
        tableView?.snp.makeConstraints { constraint in
            //constraint.top.equalToSuperview().offset(50)
            constraint.top.equalToSuperview().offset(100)
            constraint.width.equalToSuperview()
            constraint.height.equalToSuperview()
        }
    }
    
    @objc func addCompany() {
        
        let alertController = UIAlertController(title: "Добавить компанию", message: "Добавь новую компанию", preferredStyle: .alert)
        let addAction = UIAlertAction(title: "Добавить", style: .default) { action in
            let textField = alertController.textFields?[0]
            print(textField?.text)

            self.coreManager.addData(company: textField?.text ?? "123")
            
            self.tempArr = self.coreManager.fetchData()
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
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tempArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = tempArr[indexPath.row].companyName
        return cell
    }
    
    
}

