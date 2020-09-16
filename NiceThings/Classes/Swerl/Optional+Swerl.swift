//
//  Optional+Swerl.swift
//  Swerl
//
//  Created by Phil Nash on 11/03/2019.
//  Copyright © 2019 Two Blue Cubes. All rights reserved.
//

import Foundation

public struct OptionalNotSet: Error, Equatable {
    let message: String
    let file: String
    let line: UInt
}

public extension Optional {
    
    // Converts to a Result. If nil, creates a generic Error, including file/ line
    func toResult(_ file: String = #file, _ line: UInt = #line) -> Result<Wrapped, OptionalNotSet> {
        switch self {
        case .some(let wrapped):
            return .success(wrapped)
        case .none:
            return .failure(OptionalNotSet(message: "Optional not set", file: file, line: line))
        }
    }
    
    // Converts to result. If nil creates a generic Error, including the lazy message and file/ line
    func toResult(or msgFun: @autoclosure () -> String, _ file: String = #file, _ line: UInt = #line) -> Result<Wrapped, OptionalNotSet> {
        switch self {
        case .some(let wrapped):
            return .success(wrapped)
        case .none:
            return .failure(OptionalNotSet(message: msgFun(), file: file, line: line))
        }
    }
    
    // unwraps or throws a generic error, capturing file/ line
    func unwrap(_ file: String = #file, _ line: UInt = #line) throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw OptionalNotSet(message: "Optional not set", file: file, line: line)
        }
    }

    // unwraps or throws a generic error, with the supplied (lazy) message, and capturing file/ line
    func unwrap(or msgFun: @autoclosure () -> String, _ file: String = #file, _ line: UInt = #line) throws -> Wrapped {
        switch self {
        case .some(let wrapped):
            return wrapped
        case .none:
            throw OptionalNotSet(message: msgFun(), file: file, line: line)
        }
    }
}
