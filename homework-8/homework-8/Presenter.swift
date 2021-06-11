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
    
    func getCountOfEntries() -> Int {
        return companies.count
    }
    
    func addEntry() {
        let comp = Company()
        comp.companyName = "123"
        
    }
    
    func getEntry() {
        
    }
    
    
}
