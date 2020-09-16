//
//  Error+Swerl.swift
//  Swerl
//
//  Created by Phil Nash on 11/03/2019.
//  Copyright © 2019 Two Blue Cubes. All rights reserved.
//

import Foundation

public struct ResultNotSet: Error, Equatable {
    let message: String
    let file: String
    let line: UInt
}

public extension Result {
    // You can already convert from throws-to-Result by using the `catching` initialiser,
    // and Result-to-throws by using the `get()` method.
    
    // We add unwrap, that works like `get()`, but makes a new Error, capturing file/ line of the unwrap line
    func unwrap(_ file: String = #file, _ line: UInt = #line) throws -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw ResultNotSet(message: "Result assumed to contain value, but actually held error: \(error)", file: file, line: line)
        }
    }
    
    // We can convert to an optional, obviously losing any error information
    func toOptional() -> Success? {
        switch self {
        case .success(let value):
            return value
        case .failure:
            return nil // loses information
        }
    }
    
    // We can assume we have a value - the equivalent of suffix `operator !` on Optional
    // - gives a hard error otherwise
    func assume() -> Success {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            fatalError("Result assumed to contain value, but actually held error: \(error)")
        }
    }
}
