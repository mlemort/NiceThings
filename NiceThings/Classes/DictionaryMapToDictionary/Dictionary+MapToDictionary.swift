//
//  Dictionary+MapToDictionary.swift
//  INONiceThings
//
//  Created by Nicolas Aldegheri on 04/12/2018.
//

extension Dictionary {
    
    /**
     Map a dictionary to another dictionary.
     
     - parameter transform: the closure called to each (key, value) of the dictionary, used to generate an other dictionary.
     - returns: the new dictionary.
     */
    public func map<T: Hashable, U>(transform: (Key, Value) throws -> (T, U)) rethrows -> [T: U] {
        var result: [T: U] = [:]
        for (key, value) in self {
            let (transformedKey, transformedValue) = try transform(key, value)
            result[transformedKey] = transformedValue
        }
        return result
    }
}
