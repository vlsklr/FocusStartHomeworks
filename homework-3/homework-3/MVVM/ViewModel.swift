//
//  ViewModel.swift
//  homework-3
//
//  Created by Vlad on 29.05.2021.
//

import Foundation

class ViewModel {
    private let model = DataModel()
    
    var myHobbie: (myHobbieTittle: String, myHobbieText: String) {
        let myHobbie = model.hobbieInfo.typesOfHobbie[0]
        let myHobbieText = model.hobbieInfo.valueHobbies[0]
        return (myHobbie, myHobbieText)
    }
    
    var mySport: (mySportTittle: String, mySportText: String) {
        return (model.hobbieInfo.typesOfHobbie[1], model.hobbieInfo.valueHobbies[1])
    }
    
    var myNewHobbie: (myNewHobbieTittle: String, myNewHobbieText: String) {
        return (model.hobbieInfo.typesOfHobbie[2], model.hobbieInfo.valueHobbies[2])
    }
}
