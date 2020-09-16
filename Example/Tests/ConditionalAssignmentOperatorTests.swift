//
//  ConditionalAssignmentOperatorTests.swift
//  INONiceThings_ExampleTests
//
//  Created by maxime.lemort on 21/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import NiceThings
import Quick
import Nimble

class ConditionalAssignmentOperatorTests: QuickSpec {
    
    //swiftlint:disable identifier_name
    override func spec() {
        it("When conditional assigning value A to variable B with A != nil and B = nil, B must be equal to A") {
            // setup
            let a = 3
            var b: Int?
            
            // test
            b ??= a
            
            // expect
            expect(b).to(equal(a))
        }
        
        it("When conditional assigning value A to variable B with A != nil and B != nil, B must not change") {
            // setup
            let a = 3
            var b: Int? = 4
            
            // test
            b ??= a
            
            // expect
            expect(b).to(equal(4))
        }
        
        it("When conditional assigning value A to variable B with A = nil and B != nil, B must not change") {
            // setup
            let a: Int? = nil
            var b: Int? = 4
            
            // test
            b ??= a
            
            // expect
            expect(b).to(equal(4))
        }
        
        it("When conditional assigning value A to variable B with A = nil and B = nil, B must not change") {
            // setup
            let a: Int? = nil
            var b: Int?
            
            // test
            b ??= a
            
            // expect
            expect(b).to(beNil())
        }
    }
    //swiftlint:enable identifier_name
    
}
