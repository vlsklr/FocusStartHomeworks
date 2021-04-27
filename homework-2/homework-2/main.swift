//
//  main.swift
//  homework-2
//
//  Created by user188734 on 4/25/21.
//

import Foundation



var myArr = ThreadSafeArray<Int>()
var threadSafeStringArray = ThreadSafeArray<String>()
let queue = DispatchQueue(label: "MyConcurrentQueue",  attributes: .concurrent)

func insertValues() {
    for i in 0...1000 {
        myArr.append(i)
    }
}

func insertStrings(_ value: String) {
    for i in 0...1000 {
        threadSafeStringArray.append("\(i) + \(value)")
    }
    
}

queue.async {
    insertValues()
    insertStrings("Val")
}

queue.async {
    insertValues()
    insertStrings("ues")
}
sleep(5)
print("Int array count \(myArr.count) is empty: \(myArr.isEmpty)")
print("String array \(threadSafeStringArray.count) is empty \(threadSafeStringArray.isEmpty)")
print(myArr[0])
print(threadSafeStringArray.contains("12345"))
threadSafeStringArray.remove(at: 5)
sleep(5)
print(threadSafeStringArray.count)

