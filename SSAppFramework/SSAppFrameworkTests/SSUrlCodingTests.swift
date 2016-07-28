//
//  SSUrlCodingTests.swift
//  SSAppFramework
//
//  Created by ShawnDu on 16/7/28.
//  Copyright © 2016年 ShawnDu. All rights reserved.
//

import XCTest
@testable import SSAppFramework

class SSUrlCodingTests: XCTestCase {

    func testDecodeParams() {
        let url = "http://act.m.dmall.com/special/vipWelfare/vipWelfare.html?8_4934797&dmallShowCardAction=0"
       print(SSUrlCoding.decodeUrl(url))
    }

}
