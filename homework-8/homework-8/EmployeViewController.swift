//
//  EmployeViewController.swift
//  homework-8
//
//  Created by Vlad on 13.06.2021.
//

import UIKit
import SnapKit

class EmployeViewController: UIViewController {
    
    var presenter: IPresenter?
    var employee: EmployeeModel?
    var companyName: String?
    var editingDone: Bool = false
    
    let nameLabel: UILabel = UILabel()
    let ageLabel: UILabel = UILabel()
    let educationLabel: UILabel = UILabel()
    let experienceLabel: UILabel = UILabel()
    let positionLabel: UILabel = UILabel()
    
    let nameTextField: UITextField = UITextField()
    let ageTextField: UITextField = UITextField()
    let educationTextField: UITextField = UITextField()
    let positionTextField: UITextField = UITextField()
    let experienceTextField: UITextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green
        initSaveButton()
        initNamePart()
        initEducationPart()
        initExperiencePart()
        initAgePart()
        initPositionPart()
        // Do any additional setup after loading the view.
    }
    
    func initSaveButton() {
        let saveItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.save, target: self, action: #selector(saveEmloyee))
        navigationItem.rightBarButtonItem = saveItem
    }
    
    @objc func saveEmloyee() {
        editingDone = true
        if var employee = self.employee {
            let oldName = employee.name
            employee.name = nameTextField.text!
            employee.age = ageTextField.text
            employee.education = educationTextField.text
            employee.experince = experienceTextField.text
            employee.position = positionTextField.text
            presenter?.updateEmployee(employee: employee, oldName: oldName)
        }else {
            if let name = nameTextField.text, let companyName = companyName {
                let employee = EmployeeModel(name: name,
                                             age: ageTextField.text,
                                             education: educationTextField.text,
                                             experince: experienceTextField.text,
                                             position: positionTextField.text)
                print(employee.name.isEmpty)
                presenter?.addEmployee(employee: employee, companyName: companyName)
            }
        }
    }
    
    func initNamePart() {
        self.view.addSubview(nameLabel)
        nameLabel.text = "Имя"
        nameLabel.backgroundColor = .white
        nameLabel.layer.cornerRadius = 5
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
        
        self.view.addSubview(nameTextField)
        nameTextField.text = employee?.name
        nameTextField.placeholder = "Введите имя"
        nameTextField.backgroundColor = .white
        nameTextField.layer.cornerRadius = 5
        nameTextField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(150)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
    }
    
    func initEducationPart() {
        self.view.addSubview(educationLabel)
        educationLabel.text = "Образование"
        educationLabel.backgroundColor = .white
        educationLabel.layer.cornerRadius = 5
        educationLabel.snp.makeConstraints { (make) in
            make.top.equalTo(nameLabel).offset(50)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
        
        self.view.addSubview(educationTextField)
        educationTextField.text = employee?.education
        educationTextField.placeholder = "Введите образование"
        educationTextField.backgroundColor = .white
        educationTextField.layer.cornerRadius = 5
        educationTextField.snp.makeConstraints { (make) in
            make.top.equalTo(nameTextField).offset(50)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
    }
    
    func initExperiencePart() {
        self.view.addSubview(experienceLabel)
        experienceLabel.text = "Опыт"
        experienceLabel.backgroundColor = .white
        experienceLabel.layer.cornerRadius = 5
        experienceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(educationLabel).offset(50)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
        
        self.view.addSubview(experienceTextField)
        experienceTextField.text = employee?.experince
        experienceTextField.placeholder = "Введите опыт"
        experienceTextField.backgroundColor = .white
        experienceTextField.layer.cornerRadius = 5
        experienceTextField.snp.makeConstraints { (make) in
            make.top.equalTo(educationTextField).offset(50)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
    }
    
    func initAgePart() {
        self.view.addSubview(ageLabel)
        ageLabel.text = "Возраст"
        ageLabel.backgroundColor = .white
        ageLabel.layer.cornerRadius = 5
        ageLabel.snp.makeConstraints { (make) in
            make.top.equalTo(experienceLabel).offset(50)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
        
        self.view.addSubview(ageTextField)
        ageTextField.text = employee?.age
        ageTextField.placeholder = "Введите возраст"
        ageTextField.backgroundColor = .white
        ageTextField.layer.cornerRadius = 5
        ageTextField.snp.makeConstraints { (make) in
            make.top.equalTo(experienceTextField).offset(50)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
    }
    
    func initPositionPart() {
        self.view.addSubview(positionLabel)
        positionLabel.text = "Должность"
        positionLabel.backgroundColor = .white
        positionLabel.layer.cornerRadius = 5
        positionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(ageLabel).offset(50)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
        
        self.view.addSubview(positionTextField)
        positionTextField.text = employee?.position
        positionTextField.placeholder = "Введите должность"
        positionTextField.backgroundColor = .white
        positionTextField.layer.cornerRadius = 5
        positionTextField.snp.makeConstraints { (make) in
            make.top.equalTo(ageTextField).offset(50)
            make.trailing.equalToSuperview().offset(-16)
            make.height.equalTo(25)
            make.width.equalTo(150)
        }
    }
}

extension EmployeViewController: IEmployeDelegate{
    
    func passPresenter(presenter: IPresenter, employee: EmployeeModel?, companyName: String)  {
        self.presenter = presenter
        self.employee = employee
        self.companyName = companyName
    }
}
