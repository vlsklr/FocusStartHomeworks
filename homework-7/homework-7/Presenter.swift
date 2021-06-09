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
        if let url = URL(string: stringURL) {
            networkManager.loadImage(url: url)
            self.networkManager.fileLocation = {  (location) in
                print("did finish downloading \(location.absoluteString)")
                if let data = try? Data(contentsOf: location) {
                    print("Размер загруженного файла \(data.count)")
                    if data.count > 0 {
                        let loaded = Model(url: stringURL, image: data)
                        
                        self.loadedImages.append(loaded)
                        DispatchQueue.main.async {
                            self.view.updateView()
                        }
                    } else {
                        self.view.showAlert(alertText: "Файл не загрузился")
                    }
                }
            }
        }else{
            view.showAlert(alertText: "С URL что-то не так")
        }
    }
    
    func getDownloadedDataFromModel(for indexPath: IndexPath) -> Model {
        let modelCell = loadedImages[indexPath.row]
        return modelCell
    }
    
    func getCountOfCells() -> Int {
        return loadedImages.count
    }
}
