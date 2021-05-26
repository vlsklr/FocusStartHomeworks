//
//  ITableVC.swift
//  homework-3
//
//  Created by user188734 on 5/26/21.
//

import Foundation

protocol ITableVC: AnyObject {
    
    var cellsCountHandler: (() -> Int)? { get set }
    var cellWillShowHandler: ((_ cell: ITableViewCellView, _ atIndex: Int) -> Void)? {  get set }

    func update()
}
