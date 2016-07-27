//
//  SSAppFrameworkTests.swift
//  SSAppFrameworkTests
//
//  Created by ShawnDu on 16/7/27.
//  Copyright © 2016年 ShawnDu. All rights reserved.
//

import XCTest
@testable import SSAppFramework

class SSAppFrameworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let page = SSPage()
        page.forward("jingji")
    }
    
}
