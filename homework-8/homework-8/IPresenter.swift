//
//  IPresenter.swift
//  homework-8
//
//  Created by user188734 on 6/11/21.
//

import Foundation

protocol IPresenter {
    func addEntry(companyName: String)
    func getEntry(indexPath: IndexPath) -> String
    func getCountOfEntries() -> Int
}
