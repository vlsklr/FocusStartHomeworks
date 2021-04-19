//
//  DataModel.swift
//  homework-1
//
//  Created by user188734 on 4/17/21.
//

struct Car {
    var manufacturer: String
    var model: String
    var bodyType: Body
    var yearOfIssue: String?
    var carNumber: String?
        
    enum Body: Int, CaseIterable {
        case sedan
        case hatchback
        case wagon
        case minivan
        case coupe
        case crossover
        case offRoad
        case truck
        case bus
        
        static func printBodytype() {
            for body in Body.allCases {
                print("\(body.rawValue) - \(body)")
            }
        }
           
    }
   
}
