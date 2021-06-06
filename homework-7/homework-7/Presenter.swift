//
//  Presenter.swift
//  homework-7
//
//  Created by Vlad on 06.06.2021.
//

import Foundation


class Presenter: IPresenter {

    private let networkManager = NetworkManager()
    var loadedImages = [Model]()
    var view: IView
    
    init(view: IView) {
        self.view = view
        let tmp = Model(url: "temp", image: Data())
        loadedImages.append(tmp)
    }
    
    func downloadImage(stringURL: String) {
        networkManager.loadImage(urlString: stringURL)
//        networkManager.loadImage(urlString: stringURL) { [weak self] result in
      //  }
    }
    
    func getDownloadedDataFromModel(for indexPath: IndexPath) -> Model {
        let modelCell = loadedImages[indexPath.row]
        return modelCell
    }
    func getCountOfCells() -> Int {
        return loadedImages.count
    }
}
