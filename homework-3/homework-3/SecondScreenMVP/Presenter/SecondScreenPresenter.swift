//
//  SecondScreenPresenter.swift
//  homework-3
//
//  Created by user188734 on 5/17/21.
//

import Foundation

class SecondScreenPresenter {
    private var _switcherState = false
    let model = DataModel()
    var switcherState: Bool {
        
        set(state) {
            _switcherState = state
        }
        get {
            return _switcherState
        }
    }
    var returnString: String {
        return self.switcherState ? model.devInfo.iosInfo : model.devInfo.nonIosInfo
    }
}
