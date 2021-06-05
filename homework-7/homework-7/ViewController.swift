//
//  ViewController.swift
//  homework-7
//
//  Created by user188734 on 6/4/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let searchBar = UISearchBar()
    let tableView = UITableView()
    private let networkManager = NetworkManager()
    var loadedImages = [Model]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSearchbar()
        initTableView()
    }
    
    func loadImg(url: String) -> Data {
        var img = Data()
        self.networkManager.loadImage(urlString: url) { [weak self] result in
            
            switch result {
            case .success(let image):
                img = image
            case .failure(let error):
                print(error)

            }
        }
        return img
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
}
extension ViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchBarText = searchBar.text else { return }
        print(searchBarText)
        let queue = DispatchQueue(label: "MyConcurrentQueue",  attributes: .concurrent)
        var group = DispatchGroup()
        var imgdata = Data()
        group.enter()
        queue.async {
             imgdata = self.loadImg(url: searchBarText)
            group.leave()
        }
        group.wait()
        let element = Model(url: searchBarText, image: imgdata)
        loadedImages.append(element)
        
        
        tableView.reloadData()
        //self.presenter?.requestForNewImage(urlString: searchBarText)
        //self.reloadDataInController()
        //searchBar.resignFirstResponder()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return loadedImages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DownloadedCell
        //
        cell.link.text = loadedImages[indexPath.row].url
        
        cell.setupCell()
        
      
            cell.downloadedImage.image = UIImage(data: self.loadedImages[indexPath.row].image!)
	
        
        //cell.link.text = "123"
       // cell = loadImg(cell: cell)
        //cell.downloadedImage.image = loadImg()
        
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 40.0
    //    }
    
    
}

