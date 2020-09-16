//
//  MulticastDelegateTests.swift
//  INONiceThings_ExampleTests
//
//  Created by maxime.lemort on 12/03/2020.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import NiceThings
import Quick
import Nimble

protocol MyCustomClassDelegate: class {

    func aFonctionToBeProcessByDelegate()

}

class MulticastDelegateTests: QuickSpec {

    class AClass: MyCustomClassDelegate {
        
        var aFonctionToBProcessByDelegateCalled = false
        
        func aFonctionToBeProcessByDelegate() {
            aFonctionToBProcessByDelegateCalled = true
        }

    }

    class AnOtherClass: MyCustomClassDelegate {
        
        var aFonctionToBProcessByDelegateCalled = false
        
        func aFonctionToBeProcessByDelegate() {
            aFonctionToBProcessByDelegateCalled = true
        }

    }

    //swiftlint:disable:next function_body_length
    override func spec() {
        describe("add") {
            it("When add 2 delegates to a MulticastDelegate, the invocation is called on both delegates synchronously") {
                // setup
                let multicastDelegate = MulticastDelegate<MyCustomClassDelegate>()
                let aClass = AClass()
                let anOtherClass = AnOtherClass()
                multicastDelegate.add(delegate: aClass)
                multicastDelegate.add(delegate: anOtherClass)
                
                // test
                multicastDelegate.invoke {
                    $0.aFonctionToBeProcessByDelegate()
                }
                
                // expect
                expect(aClass.aFonctionToBProcessByDelegateCalled).to(beTrue())
                expect(anOtherClass.aFonctionToBProcessByDelegateCalled).to(beTrue())
            }
            
            it("When add 10 delegates to a MulticastDelegate, the invocation is called on all delegates synchronously") {
                // setup
                let multicastDelegate = MulticastDelegate<MyCustomClassDelegate>()
                let delegates = (1 ... 10).map { _ in AClass() }
                delegates.forEach { multicastDelegate.add(delegate: $0) }
                
                // test
                multicastDelegate.invoke {
                    $0.aFonctionToBeProcessByDelegate()
                }
                
                // expect
                delegates.forEach {
                    expect($0.aFonctionToBProcessByDelegateCalled).to(beTrue())
                }
            }
            
            it("When add 2 delegates to a MulticastDelegate, the invocation is called on both delegates asynchronously") {
                // setup
                let multicastDelegate = MulticastDelegate<MyCustomClassDelegate>()
                let aClass = AClass()
                let anOtherClass = AnOtherClass()
                multicastDelegate.add(delegate: aClass)
                multicastDelegate.add(delegate: anOtherClass)
                
                // test
                multicastDelegate.invoke(dispatchQueue: DispatchQueue.global(qos: .background)) {
                    $0.aFonctionToBeProcessByDelegate()
                }
                
                // expect
                expect(aClass.aFonctionToBProcessByDelegateCalled).toEventually(beTrue())
                expect(anOtherClass.aFonctionToBProcessByDelegateCalled).toEventually(beTrue())
            }
        }
        
        describe("remove") {
            it("When add 2 delegates to a MulticastDelegate and remove one, the invocation is called on only 1 delegate") {
                // setup
                let multicastDelegate = MulticastDelegate<MyCustomClassDelegate>()
                let aClass = AClass()
                let anOtherClass = AnOtherClass()
                multicastDelegate.add(delegate: aClass)
                multicastDelegate.add(delegate: anOtherClass)
                multicastDelegate.remove(delegate: anOtherClass)
                
                // test
                multicastDelegate.invoke {
                    $0.aFonctionToBeProcessByDelegate()
                }
                
                // expect
                expect(aClass.aFonctionToBProcessByDelegateCalled).to(beTrue())
                expect(anOtherClass.aFonctionToBProcessByDelegateCalled).to(beFalse())
            }
        }
        
        describe("weak") {
            it("When add 2 delegates to a MulticastDelegate and free one, the invocation is called on only 1 delegate") {
                // setup
                let multicastDelegate = MulticastDelegate<MyCustomClassDelegate>()
                let aClass = AClass()
                var anOtherClass: AnOtherClass? = AnOtherClass()
                var invocationCount = 0
                multicastDelegate.add(delegate: aClass)
                multicastDelegate.add(delegate: anOtherClass!) //swiftlint:disable:this force_unwrapping

                anOtherClass = nil
                
                // test
                multicastDelegate.invoke {
                    invocationCount += 1
                    $0.aFonctionToBeProcessByDelegate()
                }
                
                // expect
                expect(invocationCount).to(equal(1))
            }
        }
    }
    
}
