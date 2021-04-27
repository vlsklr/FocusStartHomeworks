//
//  CustomArray.swift
//  homework-2
//
//  Created by user188734 on 4/25/21.
//
import Foundation

class ThreadSafeArray<Type: Equatable> {
        
    var isEmpty: Bool = true
    var count: Int = 0
    private var itemsArray = [Type]()
    private let barrierQueue = DispatchQueue(label: "MyBarrierQueue", attributes: .concurrent)
    
    func append(_ item: Type) {
        self.barrierQueue.async(flags: .barrier)  {
            self.itemsArray.append(item)
            self.count += 1
            self.isEmpty = self.count == 0 ? true : false
        }
        
        
    }
    
    func remove(at index: Int) {
        self.barrierQueue.async(flags: .barrier){
            if index < self.count {
                self.itemsArray.remove(at: index)
                self.count -= 1
                self.isEmpty = self.count == 0 ? true : false
            }
        }
    }
    
    subscript(index: Int) -> String {
        var answer = "Index out of range"
        self.barrierQueue.sync {
            if index < self.count {
                answer = "\(self.itemsArray[index])"
            }
        }
        return answer
    }
    
    func contains(_ element: Type) -> Bool {
        self.barrierQueue.sync {
            if self.itemsArray.firstIndex(of: element) != nil{
                return true
            }
            return false
        }
        
    }
}
