//
//  Array+RemoveFirstObjectMaching.swift
//  INONiceThings
//
//  Created by Maxime Lemort on 16/10/2017.
//

import Foundation

public extension Array where Element: Equatable {
    
    /**
     Remove first collection element that is equal to the given `object`.
     
     - parameter object: the object to remove
     */
    mutating func removeFirstObject(maching: Element) {
        if let index = firstIndex(of: maching) {
            remove(at: index)
        }
    }
}
