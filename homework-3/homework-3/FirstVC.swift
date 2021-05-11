//
//  FirstVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit

class FirstVC: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.ageTextField.delegate = self
    }
    
    @IBAction func ageButtonAction() {
        var ageResponse = ""
        if ageTextField.text == "27" {
            ageResponse = "Ты угадал"
        }else{
            ageResponse = "Ты не угадал"
        }
        
        let ageAlert = UIAlertController(title: "Мой возраст 27", message: ageResponse, preferredStyle: .alert)
        ageAlert.addAction(UIAlertAction(title: "Понятно", style: .default))
        self.present(ageAlert, animated: true)
    }
}
extension FirstVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
