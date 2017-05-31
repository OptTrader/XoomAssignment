//
//  UserDefaultsManagement.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

public class UserDefaultsManagement {
    
    // MARK: Currency
    
    public class func getCurrency() -> String {
        let userDefaults = UserDefaults.standard
        var currency: String {
            get {
                if let returnCurrency = userDefaults.object(forKey: Constants.UserDefaultsLastCurrency) {
                    return returnCurrency as! String
                } else {
                   return "MX"
                }
            }
            set {
                userDefaults.set(newValue, forKey: Constants.UserDefaultsLastCurrency)
                userDefaults.synchronize()
            }
        }
        return currency
    }
    
    public class func saveCurrency(currency: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(currency, forKey: Constants.UserDefaultsLastCurrency)
        userDefaults.synchronize()
    }
    
    // MARK: Country
    
    public class func getCountry() -> String {
        let userDefaults = UserDefaults.standard
        var country: String {
            get {
                if let returnCountry = userDefaults.object(forKey: Constants.UserDefaultsLastCountry) {
                    return returnCountry as! String
                } else {
                    return "🇲🇽 Mexico"
                }
            }
            set {
                userDefaults.set(newValue, forKey: Constants.UserDefaultsLastCountry)
                userDefaults.synchronize()
            }
        }
        return country
    }
    
    public class func saveCountry(country: String) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(country, forKey: Constants.UserDefaultsLastCountry)
        userDefaults.synchronize()
    }
    
    // MARK: Constants
    
    private struct Constants {
        static let UserDefaultsLastCurrency = "lastCurrency"
        static let UserDefaultsLastCountry = "lastCountry"
    }
}
