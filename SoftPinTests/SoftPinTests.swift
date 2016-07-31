//
//  SoftPinTests.swift
//  SoftPinTests
//
//  Created by LoHung Chang on 2016/5/18.
//  Copyright © 2016年 Willey.lo. All rights reserved.
//

import XCTest
@testable import SoftPin

class SoftPinTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        print("----------start----------")
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        print("------------End------------")
    }
    
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func test_userdefault() {
        let userdefault = NSUserDefaults.standardUserDefaults()
        print(Array(userdefault.dictionaryRepresentation().keys).count)
        
        userdefault.setObject(546546546, forKey: "435465464")
        
        print(Array(userdefault.dictionaryRepresentation().keys).count)
        
        let appDomain = NSBundle.mainBundle().bundleIdentifier!
        userdefault.removePersistentDomainForName(appDomain)
        
        print(Array(userdefault.dictionaryRepresentation().keys).count)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
