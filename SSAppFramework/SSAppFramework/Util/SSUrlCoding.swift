//
//  SSUrlCoding.swift
//  SSAppFramework
//
//  Created by ShawnDu on 16/7/27.
//  Copyright © 2016年 ShawnDu. All rights reserved.
//

import Foundation

public struct SSUrlInfo {
    var url: String?
    var urlOrigin: String?
    var urlPath: String?
    var urlProtocol: String?
    var animation: String?
    var appPageName: String?
    var params = NSMutableArray()
    var frameworkParams = NSMutableDictionary()
}

public struct SSUrlCoding {
    static func decodeUrlToModel(url: String) -> SSUrlInfo? {
        var info = SSUrlInfo()
        let urlTrim = url.stringByTrimmingCharactersInSet(.whitespaceCharacterSet())
        if urlTrim.isEmpty {
            return info
        }
        let questionMark = urlTrim.rangeOfString("?")
        if urlTrim.endIndex > questionMark?.endIndex {
            let paramUrl = urlTrim.substringFromIndex((questionMark?.endIndex)!)
            info = decodeParams(paramUrl)
            info.urlPath = urlTrim.substringToIndex((questionMark?.startIndex)!)
        } else {
            info.urlPath = urlTrim
        }
        info.urlOrigin = urlTrim
        
        let protocolMark = urlTrim.rangeOfString("://")
        if let startIndex = protocolMark?.startIndex {
            info.urlProtocol = urlTrim.substringToIndex(startIndex)
            let behindProtocolMark = urlTrim.substringFromIndex((protocolMark?.endIndex)!)
            let pathComponents = behindProtocolMark.componentsSeparatedByCharactersInSet(NSCharacterSet(charactersInString: "?"))
            info.appPageName = pathComponents[0]
        }
        
        let bufferString = NSMutableString()
        bufferString.appendString(info.urlPath!)
        if info.params.count > 0 {
            bufferString.appendString("?")
            var first = true
            for dict in info.params {
                if let dict = dict as? NSDictionary {
                    for (key, value) in dict {
                        if first {
                            first = false
                        } else {
                            bufferString.appendString("&")
                        }
                        if let value = value as? String  {
                            if value.isEmpty {
                                bufferString.appendString(codeUrl(String(key))!)
                            } else {
                                bufferString.appendFormat("%@=%@", codeUrl(String(key))!, codeUrl(value)!)
                            }
                        }
                    }
                }
            }
        }
        info.url = bufferString as String
        return info
    }
    
    static func decodeParams(paramUrl: String) -> SSUrlInfo {
        var info = SSUrlInfo()
        if paramUrl.isEmpty {
            return info
        }
        let paramUrlTrim = paramUrl.stringByTrimmingCharactersInSet(.whitespaceCharacterSet())
        info.urlOrigin = paramUrlTrim
        info.url = paramUrlTrim
        let components = paramUrlTrim.componentsSeparatedByString("&")
        for element in components {
            let keyValuePair = element.componentsSeparatedByString("=")
            if keyValuePair.count < 2 {
                let dict = NSDictionary(dictionary: [element: ""])
                info.params.addObject(dict)
                continue
            }
            let key = decodeUrl(keyValuePair[0])?.stringByTrimmingCharactersInSet(.whitespaceCharacterSet())
            let value = decodeUrl(keyValuePair[1])?.stringByTrimmingCharactersInSet(.whitespaceCharacterSet())
            if let key = key {
                if let value = value {
                    if key.characters.first == "@" {
                        if value.characters.count > 0 {
                            info.frameworkParams.setObject(value, forKey: key)
                        }
                    } else {
                        let dict = NSDictionary(dictionary: [key: value])
                        info.params.addObject(dict)
                    }
                }
            }
            
        }
        return info
    }
    
    static func decodeUrl(urlStr: String) -> String? {
        if urlStr.characters.count < 1 {
            return nil
        }
        let outputStr = NSMutableString(string: urlStr)
        outputStr.replaceOccurrencesOfString("+", withString: "", options: .LiteralSearch, range: NSMakeRange(0, outputStr.length))
        return outputStr.stringByRemovingPercentEncoding
    }
    
    static func codeUrl(urlStr: String) -> String?{
        let customAllowedSet =  NSCharacterSet(charactersInString:"!*'();:@&=+$,/?%#[]")
        return urlStr.stringByAddingPercentEncodingWithAllowedCharacters(customAllowedSet)
    }
}






