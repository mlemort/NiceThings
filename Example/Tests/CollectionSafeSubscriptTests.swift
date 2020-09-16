//
//  CollectionSafeSubscriptTests.swift
//  INONiceThings_ExampleTests
//
//  Created by maxime.lemort on 21/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import NiceThings
import Quick
import Nimble

class CollectionSafeSubscriptTests: QuickSpec {

    override func spec() {
        it("When the index exist, it must return an optional with the element") {
            // setup
            let array = ["apple", "peach", "banana", "blueberry"]
            
            // test
            let res = array[safe: 2]
            
            // expect
            expect(res).to(equal(Optional.some("banana")))
        }
        
        it("When the index doesn't exist, it must return nil") {
            // setup
            let array = ["apple", "peach", "banana", "blueberry"]
            
            // test
            let res = array[safe: 14]
            
            // expect
            expect(res).to(beNil())
        }
    }
    
}
