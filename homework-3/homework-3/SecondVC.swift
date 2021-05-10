//
//  SecondVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit

class SecondVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initVC()
        //view.backgroundColor = .black
        // Do any additional setup after loading the view.
    }
    @objc func switchStateDidChange(_ sender:UISwitch){
        if (sender.isOn == true){
            print("UISwitch state is now ON")
        }
        else{
            print("UISwitch state is now Off")
        }
    }
    func initVC() {
        view.backgroundColor = .cyan
        
        let textField = UITextField(frame: CGRect(x: 50, y: 50, width: 100, height: 100))
        let myswitch = UISwitch(frame: CGRect(x: UIScreen.main.bounds.width / 2, y: 150, width: 100, height: 100))
        textField.backgroundColor = .cyan
        textField.text = "123456"
        view.addSubview(textField)
        view.addSubview(myswitch)

        myswitch.addTarget(self, action: #selector(SecondVC.switchStateDidChange(_:)), for: .valueChanged)

        
        
        
    }

}
