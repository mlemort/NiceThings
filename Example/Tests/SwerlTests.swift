//
//  SwerlTests.swift
//  INONiceThings_ExampleTests
//
//  Created by maxime.lemort on 21/02/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

@testable import NiceThings
import Quick
import Nimble

class SwerlTests: QuickSpec {
    
    //swiftlint:disable:next function_body_length
    override func spec() {
        describe("optional") {
            describe("toResult") {
                it("When convert not nil optional to result, the result is a success with the value") {
                    // setup
                    let number: Int? = 4
                    
                    // test
                    let res = number.toResult()
                    
                    // expect
                    let result = Result<Int, OptionalNotSet>.success(4)
                    expect(res).to(equal(result))
                }
                
                it("When convert nil optional to result, the result is an error") {
                    // setup
                    let number: Int? = nil
                    
                    // test
                    let res = number.toResult()
                    
                    // expect
                    let result = Result<Int, OptionalNotSet>.failure(OptionalNotSet(message: "Optional not set", file: #file, line: 36))
                    expect(res).to(equal(result))
                }
                
                it("When convert not nil optional to result with message, the result is a success with the value") {
                    // setup
                    let number: Int? = 4
                    
                    // test
                    let res = number.toResult(or: "This is a custom error message")
                    
                    // expect
                    let result = Result<Int, OptionalNotSet>.success(4)
                    expect(res).to(equal(result))
                }
                
                it("When convert nil optional to result with message, the result is an error with the error message") {
                    // setup
                    let number: Int? = nil
                    
                    // test
                    let res = number.toResult(or: "This is a custom error message")
                    
                    // expect
                    let result = Result<Int, OptionalNotSet>.failure(OptionalNotSet(message: "This is a custom error message", file: #file, line: 60))
                    expect(res).to(equal(result))
                }
            }
            
            describe("unwrap") {
                it("When unwrap not nil optional to error, it must return the value") {
                    // setup
                    let number: Int? = 4
                    
                    // test
                    var res: Int = 0
                    do {
                        res = try number.unwrap()
                    } catch {
                    }
                    
                    // expect
                    expect(res).to(equal(4))
                }
                
                #if arch(x86_64)
                it("When unwrap nil optional to error, it must throw an error") {
                    // setup
                    let number: Int? = nil
                    
                    // test
                    let handler = { _ = try number.unwrap() }
                    
                    // expect
                    let error = OptionalNotSet(message: "Optional not set", file: #file, line: 90)
                    expect(handler).to(throwError(error))
                }
                #endif
                
                it("When unwrap not nil optional to error with message, it must return the value") {
                    // setup
                    let number: Int? = 4
                    
                    // test
                    var res: Int = 0
                    do {
                        res = try number.unwrap(or: "This is a custom message")
                    } catch {
                    }
                    
                    // expect
                    expect(res).to(equal(4))
                }
                
                #if arch(x86_64)
                it("When unwrap nil optional to error with message, it must throw an error") {
                    // setup
                    let number: Int? = nil
                    
                    // test
                    let handler = { _ = try number.unwrap(or: "This is a custom message") }
                    
                    // expect
                    let error = OptionalNotSet(message: "This is a custom message", file: #file, line: 119)
                    expect(handler).to(throwError(error))
                }
                #endif
            }
        }
        
        describe("result") {
            describe("unwrap") {
                it("When unwrap success result, it return the value") {
                    // setup
                    let result = Result<Int, ResultNotSet>.success(3)
                    
                    // test
                    var res: Int = 0
                    do {
                        res = try result.unwrap()
                    } catch {
                    }
                    
                    // expect
                    expect(res).to(equal(3))
                }
                
                #if arch(x86_64)
                it("When unwrap failure result, it throw an error") {
                    // setup
                    let result = Result<Int, ResultNotSet>.failure(ResultNotSet(message: "Error Message", file: #file, line: #line))
                    
                    // test
                    let handler = { _ = try result.unwrap() }
                    
                    // expect
                    let error = ResultNotSet(message: "Result assumed to contain value, but actually held error: ResultNotSet(message: \"Error Message\", file: \"\(#file)\", line: 149)", file: #file, line: 152)
                    expect(handler).to(throwError(error))
                }
                #endif
            }
            
            describe("toOptional") {
                it("When toOptional success result, it return the optional with the value") {
                    // setup
                    let result = Result<Int, ResultNotSet>.success(3)
                    
                    // test
                    let res = result.toOptional()
                    
                    // expect
                    expect(res).to(equal(Optional.some(3)))
                }
                
                it("When toOptional failure result, it return nil") {
                    // setup
                    let result = Result<Int, ResultNotSet>.failure(ResultNotSet(message: "Error Message", file: #file, line: #line))
                    
                    // test
                    let res = result.toOptional()
                    
                    // expect
                    expect(res).to(beNil())
                }
            }
            
            describe("assume") {
                it("When assume success result, it return the value") {
                    // setup
                    let result = Result<Int, ResultNotSet>.success(3)
                    
                    // test
                    let res = result.assume()
                    
                    // expect
                    expect(res).to(equal(3))
                }
                
                #if (os(macOS) || os(iOS)) && arch(x86_64)
                it("When assume failure result, it crash") {
                    // setup
                    let result = Result<Int, ResultNotSet>.failure(ResultNotSet(message: "Error Message", file: #file, line: #line))
                                        
                    // test
                    let handler = { _ = result.assume() }
                    
                    // expect
                    expect(handler).to(throwAssertion())
                }
                #endif
            }
        }
    }
}
