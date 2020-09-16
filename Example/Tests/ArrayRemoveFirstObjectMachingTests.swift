//
//  ArrayRemoveFirstObjectMachingTests.swift
//  INONiceThings_ExampleTests
//
//  Created by maxime.lemort on 21/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import NiceThings
import Quick
import Nimble

class ArrayRemoveFirstObjectMachingTests: QuickSpec {
    
    override func spec() {
        it("When removing an element of the array, the array do not contain the element anymore.") {
            // setup
            var array = [12, 16, 2, 7]
            
            // test
            array.removeFirstObject(maching: 16)
            
            // expect
            expect(array).to(equal([12, 2, 7]))
        }
        
        it("When removing an element not in the array, the array do not change.") {
            // setup
            var array = [12, 16, 2, 7]
            
            // test
            array.removeFirstObject(maching: 24)
            
            // expect
            expect(array).to(equal([12, 16, 2, 7]))
        }
        
        it("When removing an element present multiple times in the array, the array remove the first one.") {
            // setup
            var array = ["orange", "apple", "banana", "apple", "blueberry", "apple"]
            
            // test
            array.removeFirstObject(maching: "apple")
            
            // expect
            expect(array).to(equal(["orange", "banana", "apple", "blueberry", "apple"]))
        }
    }
    
}
