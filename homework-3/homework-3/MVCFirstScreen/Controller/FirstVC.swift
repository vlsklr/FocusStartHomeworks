//
//  FirstVC.swift
//  homework-3
//
//  Created by user188734 on 5/10/21.
//

import UIKit

class FirstVC: UIViewController {
    
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var secondNameLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var patronymLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    
    let model = DataModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData(model)
        self.ageTextField.delegate = self
    }
    
    @IBAction func ageButtonAction() {
        var ageResponse = ""
        if ageTextField.text == model.personInfo.age {
            ageResponse = "Ты угадал"
        }else{
            ageResponse = "Ты не угадал"
        }
        
        let ageAlert = UIAlertController(title: "Мой возраст \(model.personInfo.age)", message: ageResponse, preferredStyle: .alert)
        ageAlert.addAction(UIAlertAction(title: "Понятно", style: .default))
        self.present(ageAlert, animated: true)
    }
    
    func setData(_ model: DataModel) {
        firstNameLabel.text = model.personInfo.firstName
        secondNameLabel.text = model.personInfo.secondName
        patronymLabel.text = model.personInfo.patronym
        cityLabel.text = model.personInfo.city
    }
}
extension FirstVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
