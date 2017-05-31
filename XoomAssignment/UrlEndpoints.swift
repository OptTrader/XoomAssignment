//
//  UrlEndpoints.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

public class UrlEndpoints {
    
    class func endpointForXoomExchangeRateApi(_ symbol: String) -> String {
        let baseUrl = "https://www.xoom.com/mapi/v1/countries/"
        let endpoint = baseUrl + "\(symbol)"
        return endpoint
    }
}
