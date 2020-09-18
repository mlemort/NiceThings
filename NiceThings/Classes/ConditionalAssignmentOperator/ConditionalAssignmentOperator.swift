//
//  ConditionalAssignmentOperator.swift
//  INONiceThings
//
//  Created by maxime.lemort on 08/08/2018.
//

import Foundation

infix operator ??= : AssignmentPrecedence
@discardableResult
public func ??=<T> (lhs: inout T?, rhs: @autoclosure () -> T?) -> T? {
    if lhs == nil {
        lhs = rhs()
    }
    return lhs
}
