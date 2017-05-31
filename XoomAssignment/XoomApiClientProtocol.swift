//
//  XoomApiClientProtocol.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

typealias CurrencyModelCallback = (Currency) -> Void

protocol XoomApiClientProtocol {
    static func requestExchangeRate(symbol: String,
                                    onSuccess: CurrencyModelCallback?,
                                    onError: ErrorCallback?)
}
