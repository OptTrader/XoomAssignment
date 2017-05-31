//
//  Formatters.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//
//  https://stackoverflow.com/questions/28016578/swift-how-to-create-a-date-time-stamp-and-format-as-iso-8601-rfc-3339-utc-tim

import Foundation

public class Formatters {
    public static let sharedInstance = Formatters()
    
    private let fxFormatter = NumberFormatter()
    private let currencyFormatter = NumberFormatter()
    private let dateFormatter = DateFormatter()

    init() {
        fxFormatter.usesGroupingSeparator = true
        fxFormatter.numberStyle = .decimal
        fxFormatter.maximumFractionDigits = 4
        fxFormatter.minimumFractionDigits = 4
        fxFormatter.minimumIntegerDigits = 1
        
        currencyFormatter.usesGroupingSeparator = true
        currencyFormatter.numberStyle = .decimal
        currencyFormatter.maximumFractionDigits = 2
        currencyFormatter.minimumFractionDigits = 2
        currencyFormatter.minimumIntegerDigits = 1
        
        dateFormatter.calendar = Calendar(identifier: .iso8601)
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        
    }
    
    public func stringFromFxPrice(price: Double?) -> String? {
        guard let price = price else { return nil }
        return fxFormatter.string(from: NSNumber(value: price))
    }
    
    public func stringFromCurrencyPrice(price: Double?) -> String? {
        guard let price = price else { return nil }
        return currencyFormatter.string(from: NSNumber(value: price))
    }
    
    public func dateFromString(key: String?) -> Date? {
        guard let key = key else { return nil }
        return dateFormatter.date(from: key)
    }
    
}
