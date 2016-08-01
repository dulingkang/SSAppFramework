//
//  SSObjectCache.swift
//  SSAppFramework
//
//  Created by ShawnDu on 16/7/29.
//  Copyright © 2016年 ShawnDu. All rights reserved.
//

import Foundation

struct CacheElement {
    var key = ""
    var value: AnyObject!
    init(key: String, value: AnyObject) {
        self.key = key
        self.value = value
    }
}

public class SSObjectCache {
    
    private var count: Int = 12
    private var objectArray = Array<CacheElement>()
    private var objectDict = [String: AnyObject]()
    
    init(count: Int) {
        self.count = count
    }
    
    //MARK: -  public mehod
    public func cacheObject(key: String, value: AnyObject) {
        self.removeObject(key)
        if objectArray.count >= self.count {
            self.removeObject((objectArray.first?.key)!)
        }
        objectDict.updateValue(value, forKey: key)
        let cacheElement = CacheElement(key: key, value: value)
        objectArray.append(cacheElement)
    }
    
    public func getObject(key: String)  -> AnyObject? {
        return objectDict[key]
    }
    
    public func removeObject(key: String) {
        objectDict.removeValueForKey(key)
        var index: Int = 0
        for dict in objectArray {
            if dict.key == key {
                self.objectArray.removeAtIndex(index)
                break
            }
            index += 1
        }
    }
    
    public func getLastObject() -> AnyObject? {
        return objectDict[(objectArray.last?.key)!]
    }
    
    //MARK: - private method
}