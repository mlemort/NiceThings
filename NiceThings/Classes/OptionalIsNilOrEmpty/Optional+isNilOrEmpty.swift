//
//  Optional+isNilOrEmpty.swift
//  INONiceThings
//
//  Created by maxime.lemort on 30/09/2019.
//

import Foundation

public extension Optional where Wrapped: Collection {

    /**
     Boolean value indicate if the optional is nil or if the collection wrapped is empty
    */
    var isNilOrEmpty: Bool {
        return self?.isEmpty ?? true
    }
    
}
