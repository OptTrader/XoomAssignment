//
//  Currency.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation
import os.log

class Currency: NSObject, NSCoding {
    
    // MARK: Properties
    
    let currencySymbol: String
    let fxRate: Double
    let countryCode: String
    let timeStamp: String
    
    init?(currencySymbol: String, fxRate: Double, countryCode: String, timeStamp: String) {
        
        if currencySymbol.isEmpty || fxRate < 0 || countryCode.isEmpty || timeStamp.isEmpty {
            return nil
        }
        
        self.currencySymbol = currencySymbol
        self.fxRate = fxRate
        self.countryCode = countryCode
        self.timeStamp = timeStamp
    }
    
    // MARK: NSCoding
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(currencySymbol, forKey: PropertyKey.currencySymbolKey)
        aCoder.encode(fxRate, forKey: PropertyKey.fxRateKey)
        aCoder.encode(countryCode, forKey: PropertyKey.countryCodeKey)
        aCoder.encode(timeStamp, forKey: PropertyKey.timeStampKey)
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        guard let currencySymbol = aDecoder.decodeObject(forKey: PropertyKey.currencySymbolKey) as? String else {
            os_log("Unable to decode the currency symbol for a currency symbol object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        let fxRate = aDecoder.decodeDouble(forKey: PropertyKey.fxRateKey)

        guard let countryCode = aDecoder.decodeObject(forKey: PropertyKey.countryCodeKey) as? String else {
            os_log("Unable to decode the currency code for a currency code object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        guard let timeStamp = aDecoder.decodeObject(forKey: PropertyKey.timeStampKey) as? String else {
            os_log("Unable to decode the timestamp for a timestamp object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        self.init(currencySymbol: currencySymbol, fxRate: fxRate, countryCode: countryCode, timeStamp: timeStamp)
    }
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("currency")
    
    // MARK: Types
    
    struct PropertyKey {
        static let currencySymbolKey = "currencySymbol"
        static let fxRateKey = "fxRate"
        static let countryCodeKey = "countryCode"
        static let timeStampKey = "timeStamp"
    }
}
