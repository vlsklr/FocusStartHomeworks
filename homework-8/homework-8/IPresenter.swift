//
//  IPresenter.swift
//  homework-8
//
//  Created by user188734 on 6/11/21.
//

import Foundation

protocol IPresenter {
    func addCompany(companyName: String)
    func getCompany(indexPath: IndexPath) -> String
    func getCountOfCompanies() -> Int
    func getCountOfEmplyees(indexPath: IndexPath) -> Int
    func getEmployee(indexCompany: IndexPath, indexPath: IndexPath) -> Employee
    func addEmployee(employee: EmployeeModel, companyName: String)
    func updateEmployee(employee: EmployeeModel, oldName: String)
    func deleteCompany(companyName: String)
    func deleteEmployee(employeeName: String)
}
