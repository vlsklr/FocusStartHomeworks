//
//  Presenter.swift
//  homework-8
//
//  Created by user188734 on 6/11/21.
//

import Foundation

class Presenter: IPresenter {
     
    private var companies = [Company]()
    private var storageManager:ICoreDataManager = CoreDataManager()
    init() {
        companies = storageManager.fetchData()
    }
    
    func getCountOfCompanies() -> Int {
        return companies.count
    }
    
    func addCompany(companyName: String) {
        storageManager.addData(company: companyName)
        companies = storageManager.fetchData()
        
    }
    
    func getCompany(indexPath: IndexPath) -> String {
        storageManager.loadEmployees(indexPath: indexPath)
        return companies[indexPath.row].companyName ?? ""
    }
    
    func getCountOfEmplyees(indexPath: IndexPath) -> Int {
        return storageManager.loadEmployees(indexPath: indexPath).count
    }
    
    func getEmployee(indexCompany: IndexPath, indexPath: IndexPath) -> Employee {
        let employes = Array(storageManager.loadEmployees(indexPath: indexCompany))

        return employes[indexPath.row] as! Employee
    }
    
    func addEmployee(employee: EmployeeModel, companyName: String) {
        storageManager.addEmployee(employee: employee, companyName: companyName)
    }
    
    func updateEmployee(employee: EmployeeModel, oldName: String) {
        storageManager.updateEmployeeInfo(employeeModel: employee, oldName: oldName)
    }
    func deleteCompany(companyName: String) {
        storageManager.deleteCompany(companyName: companyName)
        companies = storageManager.fetchData()
    }
    func deleteEmployee(employeeName: String) {
        storageManager.deleteEmployee(employeeName: employeeName)        
    }
    
    
    
}
