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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView = UITableView()
        initTableView()
//        let tmpBar = UINavigationBar()
//        //tmpBar.topItem!.title = "some title"
//        self.view.addSubview(tmpBar)
//        let rightBarItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
//        rightBarItem.tintColor = .cyan
//        self.navigationItem.rightBarButtonItem = rightBarItem

        //self.navigationController?.navigationBar
        // Do any additional setup after loading the view.
        
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 50, y: 50, width: 320, height: 44))
        self.view.addSubview(navBar);
        navBar.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(50)
            make.width.equalToSuperview()
        }

        let navItem = UINavigationItem(title: "SomeTitle");
        let doneItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: nil, action: nil);
        navItem.rightBarButtonItem = doneItem;

        navBar.setItems([navItem], animated: false);
    }
    
    func initTableView() {
        view.addSubview(tableView ?? UITableView())
        tableView?.backgroundColor = .blue
        tableView?.delegate = self
        tableView?.dataSource = self
        //tableView?.register(DownloadedCell.self, forCellReuseIdentifier: "cell")
        tableView?.snp.makeConstraints { constraint in
            constraint.top.equalToSuperview().offset(50)
            constraint.width.equalToSuperview()
            constraint.height.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate {
    
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "123"
        return cell
    }
    
    
}

