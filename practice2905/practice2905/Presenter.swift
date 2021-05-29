//
//  Presenter.swift
//  practice2905
//
//  Created by Vlad on 29.05.2021.
//

import Foundation

class Presenter: IPresenter {
    private let networkManager: INetworkMannager = NetworkManager()
    weak var view: IViewController?
    
    init(view: IViewController) {
        self.view = view
    }
    
    init() {
        
    }
    
    func downloadData() {
        self.networkManager.load { [weak self] result in // Result<String, Error>
            switch result {
            case .failure(let error):
                print(error)
            case .success(let textData):
                self?.networkManager.loadCatImage(code: textData.0, completion: { [weak self] result in
                    switch result {
                    case .success(let imageData):
                        DispatchQueue.main.async {
                            self?.view?.showImage(data: imageData)
                        }
                    case .failure(let error):
                        print(error)
                    }
                })
                DispatchQueue.main.async {
                    self?.view?.showText(text: "\(textData.1) \(textData.0)")
                }
            }
        }
    }
}
