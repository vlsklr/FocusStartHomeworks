//
//  TableViewCell.swift
//  homework-3
//
//  Created by Vlad on 22.05.2021.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell, ITableViewCellView {

    var tittleLabel = UILabel()
    var cellTextLabel = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .gray
        tittleLabel.textColor = .black
        cellTextLabel.textColor = .orange
        cellTextLabel.numberOfLines = 0
        tittleLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTextLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tittleLabel)
        contentView.addSubview(cellTextLabel)
        
        NSLayoutConstraint.activate([
            tittleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            tittleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -100),
            tittleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            tittleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            cellTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            cellTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellTextLabel.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setTittle(tittle: String) {
        tittleLabel.text = tittle
    }
    func setMainText(text: String) {
        cellTextLabel.text = text
    }
}
