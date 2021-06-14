//
//  ICoreDataManager.swift
//  homework-8
//
//  Created by user188734 on 6/11/21.
//

import Foundation

protocol ICoreDataManager {
    func addCompany(companyName: String)
    func fetchCompanies() -> [Company]
    func loadEmployees(indexPath: IndexPath) -> NSSet
    func addEmployee(employee: EmployeeModel, companyName: String)
    func updateEmployeeInfo(employeeModel: EmployeeModel, oldName: String)
    func deleteCompany(companyName: String)
    func deleteEmployee(employeeName: String)

}
