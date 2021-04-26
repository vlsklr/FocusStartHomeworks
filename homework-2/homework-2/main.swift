//
//  main.swift
//  homework-2
//
//  Created by user188734 on 4/25/21.
//

import Foundation



var myArr = ThreadSafeArray<Int>()
let queue = DispatchQueue(label: "MyConcurrentQueue",  attributes: .concurrent)

func insertValues() {
    for i in 0...1000 {
        myArr.append(i)
    }
}

queue.async {
    insertValues()
}
insertValues()

queue.async {
    insertValues()
}
print(myArr.count)
//print(myArr.contains(345))
//print (myArr[0])
//myArr.remove(at: 0)
//myArr.remove(at: 0)
//print (myArr[0])
//print(myArr.isEmpty)

