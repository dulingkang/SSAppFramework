//
//  NSObjectExtension.swift
//  SSAppFramework
//
//  Created by ShawnDu on 16/7/27.
//  Copyright © 2016年 ShawnDu. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return NSStringFromClass(self.dynamicType).componentsSeparatedByString(".").last!
    }
}