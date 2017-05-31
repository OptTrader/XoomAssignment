//
//  CurrencyViewModel.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/28/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation
import os.log

protocol MainViewControllerModelDelegate: class {
    func didReceiveDataUpdate(items: CurrencyDetailsViewModel)
    func didFailDataUpdateWithError(error: Error)
}

class CurrencyViewModel: NSObject {
    
    // MARK: Properties
    
    var currency: Currency?
    weak var delegate: MainViewControllerModelDelegate?
    
    // MARK: Properties
    
    func loadCurrency() {
        if let savedCurrency = NSKeyedUnarchiver.unarchiveObject(withFile: Currency.ArchiveURL.path) as? Currency {
            currency = savedCurrency
            self.setDataWithResponse(response: currency!)
        } else {
            let symbol = UserDefaultsManagement.getCurrency()
            fetchData(symbol: symbol)
        }
    }
   
    func saveCurrency(currency: Currency) {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(currency, toFile: Currency.ArchiveURL.path)
        if isSuccessfulSave {
            os_log("Currency successfully saved.", log: OSLog.default, type: .debug)
        } else {
            os_log("Failed to save currency.", log: OSLog.default, type: .error)
        }
    }
    
    func fetchData(symbol: String) {
        NetworkManager.requestExchangeRate(symbol: symbol, onSuccess: { data in
            DispatchQueue.global(qos: .userInitiated).async {
                DispatchQueue.main.async {
                    self.saveCurrency(currency: data)
                    self.setDataWithResponse(response: data)
                }
            }
        }, onError: { error in
            self.handleError(error: error)
            os_log("Unable to fetch data.", log: OSLog.default, type: .debug)
        })

    }

    private func setDataWithResponse(response: Currency) {
        let items = CurrencyDetailsViewModel(currency: response)
        delegate?.didReceiveDataUpdate(items: items)
    }
    
    private func handleError(error: Error) {
        delegate?.didFailDataUpdateWithError(error: error)
    }
}

class CurrencyDetailsViewModel {
    var selectCountry: String
    var exchangeRate: String
    var timeStamp: String
    var foreignCurrency: String
    
    init(currency: Currency) {
        self.selectCountry = currency.countryCode
        self.exchangeRate = "1 USD = " + Formatters.sharedInstance.stringFromFxPrice(price: currency.fxRate)! + " \(currency.currencySymbol)"
        self.timeStamp = "\(Formatters.sharedInstance.dateFromString(key: currency.timeStamp)!)"
        self.foreignCurrency = Formatters.sharedInstance.stringFromCurrencyPrice(price: currency.fxRate)! + " \(currency.currencySymbol)"
        
    }
}
