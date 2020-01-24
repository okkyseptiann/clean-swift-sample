//
//  StringExt.swift
//  Clean Swift
//
//  Created by Okky Septian Pradana on 06/08/19.
//  Copyright © 2019 Okky Septian Pradana. All rights reserved.
//

import Foundation

extension String {
    
    func encodeUrl() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)
    }
    
    func percentEncodingalphanumerics() -> String? {
        return self.addingPercentEncoding(withAllowedCharacters: NSCharacterSet.alphanumerics)
    }
    
    func decodeUrl() -> String? {
        return self.removingPercentEncoding
    }
    
    func toDouble() -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.locale = Locale(identifier: "en_US")
        return numberFormatter.number(from: self)?.doubleValue
    }
    
    func convertStringToBool() -> Bool {
        return NSString(string: self).boolValue
    }
    
    func matchesPattern(forPattern regexPattern: String) -> Bool {
        return  NSPredicate(format: "SELF MATCHES %@", regexPattern).evaluate(with: self)
    }
    
    func isAlphanumeric() -> Bool {
        return self.rangeOfCharacter(from: CharacterSet.alphanumerics.inverted) == nil && self != ""
    }
    
    func formattedNumber(fractionDigit: Int?) -> String? {
        var formattedNumber = ""
        var minimumFractionDigits: Int = 0
        if let minFractionDigit = fractionDigit {
            minimumFractionDigits = minFractionDigit
        }
        var originalString = self
        if !originalString.isEmpty {
            originalString = originalString.replacingOccurrences(of: ",", with: "")
            if var doubleFromString = Double(originalString) {
                if minimumFractionDigits == 0 {
                    doubleFromString = doubleFromString.rounded(.down)
                }
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                numberFormatter.minimumFractionDigits = minimumFractionDigits
                numberFormatter.maximumFractionDigits = minimumFractionDigits
                numberFormatter.locale = Locale(identifier: "en_US")
                formattedNumber = numberFormatter.string(from: doubleFromString as NSNumber)!
            }
        }
        return formattedNumber
    }
    
    func replacingOccurrences(of search: String, with replacement: String, count maxReplacements: Int) -> String {
        var count = 0
        var returnValue = self
        
        while let range = returnValue.range(of: search) {
            returnValue = returnValue.replacingCharacters(in: range, with: replacement)
            count += 1
            
            // exit as soon as we've made all replacements
            if count == maxReplacements {
                return returnValue
            }
        }
        
        return returnValue
    }
    
    func replace(target: String, withString: String) -> String {
        return self.replacingOccurrences(of: target, with: withString)
    }
    
}
