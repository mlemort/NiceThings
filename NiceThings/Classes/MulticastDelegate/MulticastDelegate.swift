//
//  MulticastDelegate.swift
//  INONiceThings
//
//  Created by Maxime Lemort on 16/10/2017.
//
//

import Foundation

/**
 This class is used to keep weak references to generic delegate.
 When to use this class ? It depend on the number of objects involved in the communication :
 1 to 1 => Use classic protocol delegate method.
 Many to many => Use notifications and ask yourself why you need to have this kind of communication.
 1 to Many => Use the MulticastDelegate the same way you use a classic protocol delegate method.
 */
public class MulticastDelegate<T> {
    
    private let delegates: NSHashTable<AnyObject> = NSHashTable.weakObjects()
    
    public init() {}
    
    /**
     Keep a delegate reference.
     
     - parameter delegate: the delegate to keep reference from
     */
    public func add(delegate: T) {
        delegates.add(delegate as AnyObject)
    }
    
    /**
     Remove a delegate reference.
     
     - parameter delegate: the delegate to remove reference from
     */
    public func remove(delegate: T) {
        for oneDelegate in delegates.allObjects where oneDelegate === delegate as AnyObject {
            delegates.remove(oneDelegate)
        }
    }
    
    /**
     Call a method for all delegates.
     
     - parameter dispatchQueue: nil by default. The queue where the method is called. If dispatchQueue is nil, invocation is called synchronously on the current thread.
     - parameter invocation: the method to call for each delegate.
     */
    public func invoke(dispatchQueue: DispatchQueue? = nil, invocation: @escaping (T) -> Void) {
        for delegate in delegates.allObjects {
            if let dispatchQueue = dispatchQueue {
                dispatchQueue.async {
                    //swiftlint:disable:next force_cast
                    invocation(delegate as! T)
                }
            } else {
                //swiftlint:disable:next force_cast
                invocation(delegate as! T)
            }
        }
    }
    
}
