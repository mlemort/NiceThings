//
//  DictionaryMapToDictionayTests.swift
//  INONiceThings_ExampleTests
//
//  Created by maxime.lemort on 21/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import NiceThings
import Quick
import Nimble

class DictionaryMapToDictionayTests: QuickSpec {
    
    override func spec() {
        it("When mapping a dictionary with a closure that double the key and value stored, the new dictionary must have all the keys and values doubled.") {
            // setup
            let dic = [1: 1, 2: 2, 3: 3, 4: 4]
            
            // test
            let newDic = dic.map { key, value in
                (key * 2, value * 2)
            }
            
            // expect
            expect(newDic).to(equal([2: 2, 4: 4, 6: 6, 8: 8]))
        }
    }
}
