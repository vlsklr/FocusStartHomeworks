//
//  FirstVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit

class FirstVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ageButtonAction() {
        let ageAlert = UIAlertController(title: "Мой возраст", message: "27", preferredStyle: .alert)
        ageAlert.addAction(UIAlertAction(title: "Понятно", style: .default))
        self.present(ageAlert, animated: true)
    }
}
