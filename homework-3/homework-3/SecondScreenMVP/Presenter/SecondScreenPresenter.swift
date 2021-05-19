//
//  SecondScreenPresenter.swift
//  homework-3
//
//  Created by user188734 on 5/17/21.
//

import Foundation
import UIKit

class SecondScreenPresenter: ISecondViewPresenter {
   
    weak var view: ISecondScreenView?
    let model = DataModel()
    
    init(view: ISecondScreenView) {
        self.view = view
    }
    
    init() {
        
    }
    
    func updateData(isOn: Bool) {
        let answer = isOn ? model.devInfo.iosInfo : model.devInfo.nonIosInfo
        view?.showInfo(answer: answer)
    }
}
