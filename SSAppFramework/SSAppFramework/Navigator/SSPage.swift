//
//  SSPage.swift
//  SSAppFramework
//
//  Created by ShawnDu on 16/7/27.
//  Copyright © 2016年 ShawnDu. All rights reserved.
//

import Foundation

protocol SSPageLifeCircle {
    func pageInit()
    func pageWillForwardToMe()
    func pageDidForwardToMe()
    func pageDidForwardFromMe()
    func pageWillBackwardToMe()
    func pageDidBackwardToMe()
    func pageWillBackwardFromMe()
    func pageDidBackwardFromMe()
    func pageWillBeShown()
    func pageDidShown()
    func pageWillBeHidden()
    func pageDidHidden()
    func pageDestroy()
    func canNotForwardUrl(urlStr: String)
}

public typealias forwardCallBack = ()->Void

public class SSPage: UIViewController, SSPageLifeCircle {
    
    public var navigator: SSNavigator! {
        get {
            return SSNavigator.sharedInstance
        }
    }
    
    public func forward(url: String) {
        print(#function, self.className)
        if self != navigator.topPage {
            return
        }
        navigator.forward(url)
    }
    
    public func forward(url: String, callback: forwardCallBack?) {
        if self != navigator.topPage {
            return
        }
        navigator.forward(url, callback: callback)
    }
    
    //MARK: - delegate
    func pageInit() {
        print("\(#function)\(self.className) ")
    }
    func pageWillForwardToMe() {
        print("\(#function)\(self.className) ")
    }
    func pageDidForwardToMe() {
        print("\(#function)\(self.className) ")
    }
    func pageDidForwardFromMe() {
        print("\(#function)\(self.className) ")
    }
    func pageWillBackwardToMe() {
        print("\(#function)\(self.className) ")
    }
    func pageDidBackwardToMe() {
        print("\(#function)\(self.className) ")
    }
    func pageWillBackwardFromMe() {
        print("\(#function)\(self.className) ")
    }
    func pageDidBackwardFromMe() {
        print("\(#function)\(self.className) ")
    }
    func pageWillBeShown() {
        print("\(#function)\(self.className) ")
    }
    func pageDidShown() {
        print("\(#function)\(self.className) ")
    }
    func pageWillBeHidden() {
        print("\(#function)\(self.className) ")
    }
    func pageDidHidden() {
        print("\(#function)\(self.className) ")
    }
    func pageDestroy() {
        print("\(#function)\(self.className) ")
    }
    func canNotForwardUrl(urlStr: String) {
        print("\(#function)\(urlStr) ")
    }

}