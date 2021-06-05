//
//  DownloadedCell.swift
//  homework-7
//
//  Created by user188734 on 6/4/21.
//

import Foundation
import UIKit
import SnapKit

class DownloadedCell: UITableViewCell {
    let downloadedImage = UIImageView()
    let link = UILabel()
    
    func setupCell() {
        contentView.addSubview(downloadedImage)
        contentView.addSubview(link)
        downloadedImage.backgroundColor = .blue
        link.backgroundColor = .cyan
        downloadedImage.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(15)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-15)
            make.width.equalTo(100)
            make.height.equalTo(100)
        }

        link.snp.makeConstraints { make in
            make.leading.equalTo(downloadedImage.snp.trailing).offset(15)
            make.top.equalToSuperview().offset(10)
            make.width.equalTo(250)
            make.height.equalTo(20)
        }
        
        self.contentView.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(100)
        }
    }
    
}
