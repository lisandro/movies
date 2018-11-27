//
//  String+.swift
//  movies
//
//  Created by Lisandro on 24/11/2018.
//  Copyright © 2018 Lisandro. All rights reserved.
//
import UIKit

extension String {
    private static let dateFormatter = { () -> DateFormatter in
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        return formatter
    }()
    
    var dateFromString: Date? {
        String.dateFormatter.dateFormat = "yyyy-MM-dd"
        return String.dateFormatter.date(from: self)
    }
    
    static var languageFormattedForTMDb: String {
        return Locale.current.identifier
            .replacingOccurrences(of: "_", with: "-")
    }
    
    static var regionIso31661: String {
        if let regionCode = Locale.current.regionCode {
            return regionCode
        }
        
        var locale = Locale.current.identifier
        locale = locale.replacingOccurrences(of: "-", with: "_")
        
        if let dotRange = locale.range(of: "_") {
            locale.removeSubrange(locale.startIndex..<dotRange.upperBound)
        }
        return locale
    }
}
