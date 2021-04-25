//
//  main.swift
//  homework-1
//
//  Created by user188734 on 4/17/21.
//

import Foundation

let cars: [Car] = [Car(manufacturer: "Toyota", model: "Camry", bodyType: .sedan, carNumber: "E018МТ54"), Car(manufacturer: "Mitsubishi", model: "Galant", bodyType: .sedan, yearOfIssue: "2008")]
let app = MainApp(cars: cars)
app.start()
