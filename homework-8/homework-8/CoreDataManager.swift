//
//  CoreDataManager.swift
//  homework-8
//
//  Created by user188734 on 6/11/21.
//

import CoreData
import UIKit



class CoreDataManager: ICoreDataManager {
    
    private var companies = [Company]()
    
    func saveTask(companyName: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Company", in: context)
        
        let companyObject = NSManagedObject(entity: entity!, insertInto: context) as! Company
        companyObject.companyName = companyName
        
        do {
            try context.save()
            print("Saved!")
        } catch {
            print(error.localizedDescription)
        }
    }
    
    private func fetchCompanies() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        do {
            companies = try context.fetch(fetchRequest)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addEmployee(employee: EmployeeModel, companyName: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY companyName = %@", companyName)
        var company: [Company]
        do {
            company = try context.fetch(fetchRequest)
            if let newEmployee = NSEntityDescription.insertNewObject(forEntityName: "Employee", into: context) as? Employee {
                newEmployee.name = employee.name
                newEmployee.education = employee.education
                newEmployee.experience = employee.experince
                newEmployee.age = employee.age
                newEmployee.position = employee.position
                newEmployee.company = company[0]
            }
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    func loadEmployees(indexPath: IndexPath) -> NSSet {
        fetchCompanies()
        let company = companies[indexPath.row]
        
        if let employes = company.employee {
            return employes
        }
        return NSSet()
    }
    
    func updateEmployeeInfo(employeeModel: EmployeeModel, oldName: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY name = %@", oldName)
        let employee: [Employee]
        do {
            employee = try context.fetch(fetchRequest)
            if !employee.isEmpty {
                employee[0].name = employeeModel.name
                employee[0].age = employeeModel.age
                employee[0].education = employeeModel.education
                employee[0].experience = employeeModel.experince
                employee[0].position = employeeModel.position
                try context.save()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func addData(company: String) {
        saveTask(companyName: company)
    }
    
    func fetchData() -> [Company] {
        fetchCompanies()
        return companies
    }
    
    func deleteCompany(companyName: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Company> = Company.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY companyName = %@", companyName)
        let company: [Company]
        do {
            company = try context.fetch(fetchRequest)
            if !company.isEmpty {
                context.delete(company[0])
                try context.save()
            }
        } catch {
            print(error.localizedDescription)
        }

        
    }
    func deleteEmployee(employeeName: String) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Employee> = Employee.fetchRequest()
        fetchRequest.predicate = NSPredicate(format: "ANY name = %@", employeeName)
        let employee: [Employee]
        do {
            employee = try context.fetch(fetchRequest)
            if !employee.isEmpty {
                context.delete(employee[0])
                try context.save()
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
}
