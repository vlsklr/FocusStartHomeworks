//
//  SecondVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit

class SecondVC: UIViewController, ISecondScreenView {
   
    let label = UILabel(frame: CGRect(x: 35, y: 50, width: 300, height: 400))
    let myswitch = UISwitch(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 25, y: 550, width: 100, height: 100))
    var presenter: ISecondViewPresenter = SecondScreenPresenter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SecondScreenPresenter(view: self)
        initVC()
    }
    
    @objc func switchStateDidChange(_ sender:UISwitch){
        presenter.updateData(isOn: sender.isOn)
    }
    
    func initVC() {
        label.numberOfLines = 0
        view.addSubview(label)
        view.addSubview(myswitch)
        presenter.updateData(isOn: myswitch.isOn)
        myswitch.addTarget(self, action: #selector(SecondVC.switchStateDidChange(_:)), for: .valueChanged)
    }
    
    func showInfo(answer: String) {
        label.text = answer
    }
}
