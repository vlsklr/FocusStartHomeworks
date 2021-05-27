//
//  TableVCPresenter.swift
//  homework-3
//
//  Created by user188734 on 5/26/21.
//

import Foundation

public class TableViewControllerPresenter {
    
    private weak var view: ITableVC?
    private var cellPresenters = [TableViewCellPresenter]()
    private let modelObj = DataModel()
    
    func didLoadView(view: ITableVC?) {
        self.view = view
        self.view?.cellsCountHandler = { [weak self] in
            return (self?.modelObj.hobbieInfo.typesOfHobbie.count ?? 0)
        }
        self.view?.cellWillShowHandler = { [weak self] cell, index in
            self?.cellWillShow(cell, at: index)
        }
        self.showCells()
    }
    
    func cellWillShow(_ cell: ITableViewCellView, at index: Int) {
        guard index >= 0 , index < self.recordsCount() else {
            return
        }
        let cellPresenter = self.cellPresenters[index]
        cellPresenter.didLoadView(view: cell)
    }
    
    func recordsCount() -> Int {
        return self.modelObj.hobbieInfo.typesOfHobbie.count
    }
    
    
    func showCells() {
        for i in 0...recordsCount() - 1 {
            let cellPresenter = TableViewCellPresenter(tittleText: modelObj.hobbieInfo.typesOfHobbie[i], hobbieText: modelObj.hobbieInfo.valueHobbies[i])
            self.cellPresenters.append(cellPresenter)
        }
        self.view?.update()
    }
    
}
