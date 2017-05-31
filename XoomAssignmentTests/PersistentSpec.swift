//
//  PersistentSpec.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/30/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Quick
import Nimble
@testable import XoomAssignment

class PersistentSpec: QuickSpec {
    override func spec() {
        describe("saveCurrencyToPersistent") {
            var returnedCurrencyData: Currency?
            var returnedError: Error?
            
            beforeEach {
                returnedCurrencyData = nil
                returnedError = nil
            }
        
            context("success") {
                beforeEach {
                    let path = NSTemporaryDirectory() as NSString
                    let locToSave = path.appendingPathComponent("testCurrency")
                    
                    let testCurrency = Currency(currencySymbol: "CNY",
                                                fxRate: 7.1234,
                                                countryCode: "CN",
                                                timeStamp: "2015-05-27T18:04:54.000+0000")
                    NSKeyedArchiver.archiveRootObject(testCurrency!,
                                                      toFile: locToSave)
                    returnedCurrencyData = NSKeyedUnarchiver.unarchiveObject(withFile: locToSave) as? Currency
                }
                
                it("returns Persistent Data") {
                    expect(returnedCurrencyData).toEventuallyNot(beNil(), timeout: 20)
                    expect(returnedCurrencyData?.currencySymbol) == "CNY"
                    expect(returnedCurrencyData?.countryCode) == "CN"
                    expect(returnedCurrencyData?.fxRate).to(beCloseTo(7.1156, within: 0.1))
                    expect(returnedError).toEventually(beNil())
                }
            }
        }
    }
}
