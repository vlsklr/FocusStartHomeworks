//
//  ThirdVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit
import SnapKit

class ThirdVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initThirdVC()
    }
    
    func initThirdVC() {
        let thirdVCTitle = UILabel()
        thirdVCTitle.text = "Мои увлечения"
        self.view.addSubview(thirdVCTitle)

        thirdVCTitle.snp.makeConstraints { constr in
            constr.left.equalToSuperview().inset(150)
            constr.top.equalToSuperview().inset(50)
        }
        
    }

}
