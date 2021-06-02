//
//  PopViewController.swift
//  homework-3
//
//  Created by Vlad on 31.05.2021.
//

import Foundation
import UIKit

class PopViewController: UIViewController, ILoggerProtocol {
    let items = ["1", "2", "3"]
    
    func printState(state: String) {
        print("PopViewController has \(state)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        printState(state: "appeared")
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        printState(state: "disappeared")

    }
    override func viewDidLoad() {
        self.view.backgroundColor = .systemRed
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: 350, height: 450)
        
        let myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "catCell")
        myCollectionView.backgroundColor = UIColor.white
        myCollectionView.dataSource = self
        
        view.addSubview(myCollectionView)
        
        myCollectionView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(450)
        }
    }
}

extension PopViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let catCell = collectionView.dequeueReusableCell(withReuseIdentifier: "catCell", for: indexPath)
        let imageView = UIImageView()
        imageView.image = UIImage(named: items[indexPath.row])
        catCell.addSubview(imageView)
        imageView.snp.makeConstraints{ make in
            make.top.bottom.left.right.equalToSuperview()
        }
        return catCell
    }
}
