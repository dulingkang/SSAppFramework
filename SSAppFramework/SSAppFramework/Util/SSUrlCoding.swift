//
//  SSUrlCoding.swift
//  SSAppFramework
//
//  Created by ShawnDu on 16/7/27.
//  Copyright © 2016年 ShawnDu. All rights reserved.
//

import Foundation

struct UrlInfo {
    var url: String?
    var urlOrigin: String?
    var urlPath: String?
    var urlProtocol: String?
    var animation: String?
    var appPageName: String?
    var params: NSMutableDictionary?
    var frameworkParams: NSMutableDictionary?
}

struct SSUrlCoding {
    static func decodeUrl(url: String) -> UrlInfo? {
        let urlInfo = UrlInfo()
        if url.isEmpty {
            return urlInfo
        }
        let urlTrim = url.stringByTrimmingCharactersInSet(.whitespaceCharacterSet())
        let questionMark = urlTrim.rangeOfString("?")
        if urlTrim.endIndex > questionMark?.endIndex {
            let paramUrl = urlTrim.substringFromIndex((questionMark?.endIndex)!)
        }
        
        
        
        return urlInfo
    }
}