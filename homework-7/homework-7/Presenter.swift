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
        
    }
    
    func downloadImage(stringURL: String) {
        networkManager.loadImage(urlString: stringURL)
        self.networkManager.fileLocation = { (location) in
            print("did finish downloading \(location.absoluteString)")
            if let data = try? Data(contentsOf: location) {
                let loaded = Model(url: stringURL, image: data)
                self.loadedImages.append(loaded)
            }
        }
//        let tmp = Model(url: stringURL, image: Data())
//        loadedImages.append(tmp)
        view.updateView()
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
