//
//  CurrencySpec.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/30/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Quick
import Nimble
@testable import XoomAssignment

class CurrencySpec: QuickSpec {
    override func spec() {
        describe("requestCurrencyDataWithCountryCode") {
            var returnedCurrencyData: Currency?
            var returnedError: Error?
            
            beforeEach {
                returnedCurrencyData = nil
                returnedError = nil
            }
            
            context("success") {
                beforeEach {
                    NetworkManager.requestExchangeRate(symbol: "CN", onSuccess: { data in
                        returnedCurrencyData = data
                    }, onError: { error in
                        returnedError = error
                    })
                }
                
                it("returns Xoom Data") {
                    expect(returnedCurrencyData).toEventuallyNot(beNil(), timeout: 20)
                    expect(returnedCurrencyData?.currencySymbol) == "CNY"
                    expect(returnedCurrencyData?.countryCode) == "CN"
                    expect(returnedCurrencyData?.fxRate).to(beCloseTo(6.74993835, within: 0.1))
                    expect(returnedError).toEventually(beNil())
                }
            }
            
            context("error") {
                let errorSymbol = "CNY"
                
                beforeEach {
                    NetworkManager.requestExchangeRate(symbol: errorSymbol, onSuccess: { data in
                        returnedCurrencyData = data
                    }, onError: { error in
                        returnedError = error
                    })
                }
                
                it("returns error") {
                    expect(returnedCurrencyData).toEventually(beNil())
                }
            } 
        }
    }
}
