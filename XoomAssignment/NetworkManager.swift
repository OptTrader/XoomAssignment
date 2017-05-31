//
//  NetworkManager.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation
import os.log

class NetworkManager: XoomApiClientProtocol {
    
    static func requestExchangeRate(symbol: String, onSuccess: CurrencyModelCallback?, onError: ErrorCallback?) {
        
        let urlString = UrlEndpoints.endpointForXoomExchangeRateApi(symbol)
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: request) {
            (data, response, error) in

            guard error == nil else {
                onError?(ApiError.network(error: (error)!))
                os_log("Unable to get response.", log: OSLog.default, type: .debug)
                return
            }
            
            guard let responseData = data else {
                onError?(ApiError.apiProvidedError(reason: (error?.localizedDescription)!))
                os_log("Unable to receive data.", log: OSLog.default, type: .debug)
                return
            }
            
            do {
                guard let jsonObject = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: Any] else {
                    onError?(ApiError.objectSerializationError(reason: (error?.localizedDescription)!))
                    os_log("Unable to serialize json.", log: OSLog.default, type: .debug)
                    return
                }
                
                    if let data = jsonObject["data"] as? [String: Any],
                    let fxArray = data["fx"] as? [[String: Any]],
                    let countryArray = data["country"] as? [String: Any],
                    let receiveCurrencyCode = fxArray[0]["receiveCurrencyCode"] as? String,
                    let sendFxRate = fxArray[0]["sendFxRate"] as? Double,
                    let countryCode = countryArray["countryCode"] as? String,
                    let feesChanged = countryArray["feesChanged"] as? String {
                        let currencyDetails = Currency(currencySymbol: receiveCurrencyCode,
                                                       fxRate: sendFxRate,
                                                       countryCode: countryCode,
                                                       timeStamp: feesChanged)
                        onSuccess?(currencyDetails!)
                }
            }
            catch {
                os_log("Unable convert data to JSON.", log: OSLog.default, type: .debug)
                return
            }
        }
        task.resume()
    }
}
