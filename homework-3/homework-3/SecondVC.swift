//
//  SecondVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit

class SecondVC: UIViewController {
    
    let myTexts = SecondVCData()
    let label = UILabel(frame: CGRect(x: 35, y: 50, width: 300, height: 400))
    let myswitch = UISwitch(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 25, y: 550, width: 100, height: 100))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch){
        if (sender.isOn == true){
            label.text = myTexts.iOSText
        }
        else{
            label.text = myTexts.noniOSText
        }
    }
    
    func initVC() {
        view.backgroundColor = .cyan
        label.numberOfLines = 0
        view.addSubview(label)
        view.addSubview(myswitch)
        if myswitch.isOn {
            label.text = myTexts.iOSText
        } else {
            label.text = myTexts.noniOSText
        }
        myswitch.addTarget(self, action: #selector(SecondVC.switchStateDidChange(_:)), for: .valueChanged)
    }
    
}
