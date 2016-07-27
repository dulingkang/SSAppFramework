//
//  SSNavigator.swift
//  SSAppFramework
//
//  Created by ShawnDu on 16/7/27.
//  Copyright © 2016年 ShawnDu. All rights reserved.
//

import Foundation

protocol SSNavigatorDelegate {
    func willChangePageTo(url: String)
    func didChangePageTo(url: String)
}

public class SSNavigator: UIViewController {
    static let sharedInstance = SSNavigator()
    var topPage: SSPage!
    
    func forward(url: String) {
        forward(url, callback: nil)
    }
    
    func forward(url: String, callback: forwardCallBack?) {
        print(#function)
    }
}