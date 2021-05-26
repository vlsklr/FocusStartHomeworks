//
//  TableViewCellPresenter.swift
//  homework-3
//
//  Created by user188734 on 5/25/21.
//

import Foundation

public class TableViewCellPresenter {
    
    private weak var cellView: ITableViewCellView?
    private let tittleText: String
    
    init(tittleText: String) {
        self.tittleText = tittleText
        
    }
    
    func didLoadView(view: ITableViewCellView) {
        self.cellView = view
        self.updateView()
    }
    
    private func updateView() {
        self.cellView?.setTittle(tittle: tittleText)
    }
    
}
