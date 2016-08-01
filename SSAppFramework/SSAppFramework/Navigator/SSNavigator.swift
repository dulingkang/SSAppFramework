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
    func shouldEndForward(url: String) -> Bool
    func shouldCachePage(url: String) -> Bool
}

public class SSNavigator: NSObject {
    static let sharedInstance = SSNavigator()
    var delegate: SSNavigatorDelegate?
    var pageRegistry = [String: AnyClass]()
    
    private var pageCache:SSObjectCache?
    private var url: String?
    private var info: SSUrlInfo? {
        get {
            return SSUrlCoding.decodeUrlToModel(self.url!)
        }
    }
    private var topPage: SSPage? {
        get {
            return pageCache?.getLastObject() as? SSPage
        }
    }
    
    override init() {
        pageCache = SSObjectCache(count: 12)
    }
    
    //MARK: - public method
    public func forward(url: String) {
        self.url = url
        forward(url, callback: nil)
    }
    
    public func forward(url: String, callback: forwardCallBack?) {
        if let _ = delegate?.shouldEndForward(url) {
            return
        }
        if isJumpEnable(info) {
            jump(url, callback: callback)
        }
    }
    
    //MARK: - private method
    func isJumpEnable(info: SSUrlInfo?) -> Bool {
        if let _ = info {
            if let value = info?.frameworkParams["jump"] as? String {
                if value == "true" {
                    return true
                }
            }
        }
        return false
    }
    
    private func jump(url: String, callback: forwardCallBack?) {
        let from = topPage
        if let to = resolvePage(url) {
            
        } else {
            return
        }
    }
    
    private func resolvePage(url: String) -> SSPage? {
        var cls: AnyClass?
        var page: SSPage?
        if "app" == info?.urlProtocol {
            if let appPageName = info?.appPageName {
                if let protocolCls = pageRegistry[appPageName.lowercaseString] {
                    cls = protocolCls
                } else {
                    cls = NSClassFromString(appPageName)
                }
            }
        } else if "http" == info?.urlProtocol
            || "https" == info?.urlProtocol
            || "file" == info?.urlProtocol {
            cls = SSWebPage.self
        }
        
        if cls != nil {
            if let shouldCache = self.delegate?.shouldCachePage(url) {
                if shouldCache {
                    if let tmpPage = pageCache?.getObject(String(cls)) as? SSPage {
                        page = tmpPage
                    }
                }
            }
            if page == nil {
                let className = cls.dynamicType
//                page = className.init()
//                let action = NSSelectorFromString("pageInit")
//                if cls!.respondsToSelector(action) {
//                    cls!.performSelector(action)
//                }
            }
        }
        return page
    }
}






