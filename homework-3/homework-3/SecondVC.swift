//
//  SecondVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit

class SecondVC: UIViewController, ILoggerProtocol {
    
    let myTexts = SecondVCData()
    let label = UILabel(frame: CGRect(x: 35, y: 50, width: 300, height: 400))
    let myswitch = UISwitch(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 25, y: 550, width: 100, height: 100))
    let popButton = UIButton(frame: CGRect(x: UIScreen.main.bounds.width / 2 - 50, y: 600, width: 100, height: 100))

    
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
        label.numberOfLines = 0
        popButton.backgroundColor = .green
        popButton.setTitle("Text", for: .normal)
        popButton.addTarget(self, action: #selector(SecondVC.popButtonAction), for: .touchUpInside)
        view.addSubview(label)
        view.addSubview(myswitch)
        view.addSubview(popButton)
        if myswitch.isOn {
            label.text = myTexts.iOSText
        } else {
            label.text = myTexts.noniOSText
        }
        myswitch.addTarget(self, action: #selector(SecondVC.switchStateDidChange(_:)), for: .valueChanged)
    }
    
    @objc func popButtonAction() {
        let popViewController = PopViewController()
        self.present(popViewController, animated: true, completion: nil)
    }
    
    func printState(state: String) {
        print("SecondVC has \(state)")

    }
    
    override func viewDidAppear(_ animated: Bool) {
        printState(state: "appeared")
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        printState(state: "disappeared")

    }
    
}
