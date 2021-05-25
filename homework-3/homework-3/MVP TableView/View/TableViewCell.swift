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
        cellTextLabel.textColor = .green
        tittleLabel.translatesAutoresizingMaskIntoConstraints = false
        cellTextLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(tittleLabel)
        contentView.addSubview(cellTextLabel)
        
        NSLayoutConstraint.activate([
            tittleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            tittleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30),
            tittleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            tittleLabel.heightAnchor.constraint(equalToConstant: 50),
            
            cellTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            cellTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            cellTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            cellTextLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func setTittle(tittle: String) {
        tittleLabel.text = tittle
    }
}
