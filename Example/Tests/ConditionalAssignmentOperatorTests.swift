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
    
    //swiftlint:disable identifier_name redundant_optional_initialization
    //swiftlint:disable:next function_body_length
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

        it("When chaining conditional assigning value A == nil, B == nil, C == 3, D == nil to variable E == 1, E must be equal to 1") {
            // setup
            var a: Int? = nil
            var b: Int? = nil
            var c: Int? = 3
            let d: Int? = nil
            var e: Int? = 1

            // test
            e ??= a ??= b ??= c ??= d

            // expect
            expect(e).to(equal(1))
        }

        it("When chaining conditional assigning value A == nil, B == nil, C == 3, D == nil to variable E == nil, E must be equal to 3") {
            // setup
            var a: Int?
            var b: Int?
            var c: Int? = 3
            let d: Int? = 4
            var e: Int?

            // test
            e ??= a ??= b ??= c ??= d

            // expect
            expect(e).to(equal(3))
        }

        it("When chaining conditional assigning value A == nil, B == nil, C == nil, D == nil to variable E == nil, E must be equal to nil") {
            // setup
            var a: Int? = nil
            var b: Int? = nil
            var c: Int? = nil
            let d: Int? = nil
            var e: Int? = nil

            // test
            e ??= a ??= b ??= c ??= d

            // expect
            expect(e).to(beNil())
        }

        it("When chaining conditional assigning value A == nil, B == nil, C == nil, D == nil to variable E == 3, E must be equal to nil") {
            // setup
            var a: Int? = nil
            var b: Int? = nil
            var c: Int? = nil
            let d: Int? = nil
            var e: Int? = 3

            // test
            e ??= a ??= b ??= c ??= d

            // expect
            expect(e).to(equal(3))
        }

        it("When chaining conditional assigning value A == 1, B == 2, C == 2, D == 4 to variable E == 5, E must be equal to 5") {
            // setup
            var a: Int? = 1
            var b: Int? = 2
            var c: Int? = 3
            let d: Int? = 4
            var e: Int? = 5

            // test
            e ??= a ??= b ??= c ??= d

            // expect
            expect(e).to(equal(5))
        }

        it("When chaining conditional assigning value A == 1, B == 2, C == 2, D == 4 to variable E == nil, E must be equal to 1") {
            // setup
            var a: Int? = 1
            var b: Int? = 2
            var c: Int? = 3
            let d: Int? = 4
            var e: Int?

            // test
            e ??= a ??= b ??= c ??= d

            // expect
            expect(e).to(equal(1))
        }
    }
    //swiftlint:enable identifier_name redundant_optional_initialization
    
}
