//
//  ICoreDataManager.swift
//  homework-8
//
//  Created by user188734 on 6/11/21.
//

import Foundation

protocol ICoreDataManager {
    func addData(company: String)
    func fetchData() -> [Company]
}
