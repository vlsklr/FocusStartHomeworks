//
//  ViewController.swift
//  homework-7
//
//  Created by user188734 on 6/4/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController, IView {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    var presenter: IPresenter?
    private let networkManager = NetworkManager()
    var loadedImages = [Model]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchbar()
        initTableView()
        presenter = Presenter(view: self)
    }
    
    func initSearchbar() {
        view.addSubview(searchBar)
        searchBar.delegate = self
        searchBar.placeholder = "Download Image"
        searchBar.snp.makeConstraints { contsraint in
            contsraint.top.equalTo(view).inset(50)
            contsraint.centerX.equalToSuperview()
            contsraint.width.equalToSuperview()
            contsraint.height.equalTo(50)
        }
    }
    
    func initTableView() {
        view.addSubview(tableView)
        tableView.backgroundColor = .blue
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(DownloadedCell.self, forCellReuseIdentifier: "cell")
        tableView.snp.makeConstraints { constraint in
            constraint.top.equalTo(searchBar.snp.bottom)
            constraint.width.equalToSuperview()
            constraint.height.equalToSuperview()
        }
    }
    func updateView() {
        self.tableView.reloadData()
    }
    
    func showAlert(alertText: String) {
        print(alertText)
        let alert = UIAlertController(title: "Что-то пошло не так", message: alertText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Понятно", style: .default))
        self.present(alert, animated: true)
    }
}
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        print(searchBarText)
        presenter?.downloadImage(stringURL: searchBarText)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getCountOfCells() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DownloadedCell
        cell.setupCell()
        let cellData = presenter?.getDownloadedDataFromModel(for: indexPath)
        cell.downloadedImage.image = UIImage(data: cellData?.image ?? Data())
        cell.link.text = cellData?.url
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

