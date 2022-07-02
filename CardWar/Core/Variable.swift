//
//  Variable.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

class Variable<Value> {
    
    var value: Value {
        didSet {
            DispatchQueue.main.async {
                self.onUpdate?(self.value)
            }
        }
    }
    
    var onUpdate: ((Value) -> Void)? {
        didSet {
            DispatchQueue.main.async {
                self.onUpdate?(self.value)
            }
        }
    }
    
    init(_ value: Value, _ onUpdate: ((Value) -> Void)? = nil) {
        self.value = value
        self.onUpdate = onUpdate
        DispatchQueue.main.async {
            self.onUpdate?(self.value)
        }
    }
}
