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
    
    func didLoadView(view: ITableVC?) {
        self.view = view

        self.view?.cellsCountHandler = { [weak self] in
            return 5
        }
        self.view?.cellWillShowHandler = { [weak self] cell, index in
            //self?.cellWillShow(cell, at: index)
        }

        //self.showColors()
    }
    
}
