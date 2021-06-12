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
//        let tempEmpl = Employee()
//        tempEmpl.name = "Petya"
//        companyObject.addToEmployee(tempEmpl)
        
        let set = NSMutableSet();
                
        if let employee1 = NSEntityDescription.insertNewObject(forEntityName: "Employee",                                                                 into: context) as? Employee {
            employee1.name = "Дима"
             set.add(employee1)
        }
                
         if let emploee2 = NSEntityDescription.insertNewObject(forEntityName: "Employee",                                                                into: context) as? Employee {
            emploee2.name = "Наташа"
               set.add(emploee2)
         }
                
        companyObject.employee = set

        
        
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
            print(companies.count)
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
    
}
