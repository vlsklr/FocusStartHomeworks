//
//  TableViewCell.swift
//  homework-3
//
//  Created by Vlad on 22.05.2021.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {

    var tittleLabel = UILabel()
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        tittleLabel.snp.makeConstraints { (constr) in
            //constr.left.inset(130)
            //constr.top.inset(50)
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
