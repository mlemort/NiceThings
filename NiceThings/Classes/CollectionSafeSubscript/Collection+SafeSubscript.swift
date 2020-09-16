//
//  Collection+SafeSubscript.swift
//  INONiceThings
//
//  Created by Maxime Lemort on 16/01/2018.
//

import Foundation

public extension Collection {
    
    /**
     This subscript is used to return and optionnal Element of the collection, nil if index is out of bounds.
     */
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
    
}
