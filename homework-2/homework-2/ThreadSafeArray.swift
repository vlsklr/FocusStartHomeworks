//
//  CustomArray.swift
//  homework-2
//
//  Created by user188734 on 4/25/21.
//
import Foundation

class ThreadSafeArray<Type: Equatable> {
    
    private var itemsArray = [Type]()
    private let barrierQueue = DispatchQueue(label: "MyBarrierQueue", attributes: .concurrent)
    
    var isEmpty: Bool {
        var returnIsEmpty = false
        barrierQueue.sync {
            returnIsEmpty = self.itemsArray.isEmpty
        }
        return returnIsEmpty
    }
    
    var count: Int {
        get {
            var returnCount = 0
            barrierQueue.sync {
                returnCount =  self.itemsArray.count
            }
            return returnCount
        }
    }
    
    func append(_ item: Type) {
        self.barrierQueue.async(flags: .barrier)  { [weak self] in
            self?.itemsArray.append(item)
        }
    }
    
    func remove(at index: Int) {
        self.barrierQueue.async(flags: .barrier) { [weak self] in
            if index < self?.count ?? -1 && index >= 0 {
                self?.itemsArray.remove(at: index)
            }
        }
    }
    
    subscript(index: Int) -> Type? {
        var item: Type?
        self.barrierQueue.sync {
            if index < self.count && index >= 0 {
                item = self.itemsArray[index]
            }
        }
        return item
    }
    
    func contains(_ element: Type) -> Bool {
        self.barrierQueue.sync {
            return itemsArray.contains(element)
        }
        
    }
}
