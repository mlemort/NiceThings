//
//  OptionalIsNilOrEmptyTests.swift
//  INONiceThings_ExampleTests
//
//  Created by maxime.lemort on 21/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import NiceThings
import Quick
import Nimble

class OptionalIsNilOrEmptyTests: QuickSpec {
    
    override func spec() {
        it("When collection = nil, isNilOrEmpty must be true") {
            // setup
            let collection: String? = nil
            
            // test
            let res = collection.isNilOrEmpty
            
            // expect
            expect(res).to(beTrue())
        }
        
        it("When collection != nil but empty, isNilOrEmpty must be true") {
            // setup
            let collection: String? = ""
            
            // test
            let res = collection.isNilOrEmpty
            
            // expect
            expect(res).to(beTrue())
        }
        
        it("When collection != nil and not empty, isNilOrEmpty must be false") {
            // setup
            let collection: String? = "not a nil or empty string"
            
            // test
            let res = collection.isNilOrEmpty
            
            // expect
            expect(res).to(beFalse())
        }

    }
}
