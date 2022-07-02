//
//  Array+Extensions.swift
//  CardWar
//
//  Created by Vincent Grossier on 02/07/2022.
//

import Foundation

extension Array {
    
    func splitInHalf() -> ([Element], [Element]) {
        (Array(self[0 ..< count / 2]), Array(self[count / 2 ..< count]))
    }
}
