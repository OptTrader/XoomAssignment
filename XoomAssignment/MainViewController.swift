//
//  MainViewController.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import UIKit
import CDAlertView
import BRYXBanner
import os.log

class MainViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var selectCountryTextField: UITextField!
    @IBOutlet weak var exchangeRateLabel: UILabel!
    @IBOutlet weak var timeStampLabel: UILabel!
    @IBOutlet weak var dollarLabel: UILabel!
    @IBOutlet weak var foreignCurrencyLabel: UILabel!
    
    // MARK: Properties
    
    var pickerData: [Country] = [Country]()
    var pickerView = UIPickerView()
    var errorBanner: Banner?
    var viewModel = CurrencyViewModel()
    
    // MARK: View Controller's Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createPickerView()
        setupInitialView()
        viewModel.delegate = self
        viewModel.loadCurrency()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let country = UserDefaultsManagement.getCountry()
        self.selectCountryTextField.text = country
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let symbol = UserDefaultsManagement.getCurrency()
        viewModel.fetchData(symbol: symbol)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if let existingBanner = self.errorBanner {
            existingBanner.dismiss()
        }
        super.viewWillDisappear(animated)
    }
    
    // MARK: Methods
    
    fileprivate func setupInitialView() {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: self.selectCountryTextField.frame.height))
        selectCountryTextField.leftView = paddingView
        selectCountryTextField.leftViewMode = UITextFieldViewMode.always
        
        self.dollarLabel.text = "$1 USD"
        dollarLabel.layer.borderColor = UIColor.black.cgColor
        dollarLabel.layer.borderWidth = 1.0
        dollarLabel.layer.cornerRadius = 5
        
        foreignCurrencyLabel.layer.borderColor = UIColor.black.cgColor
        foreignCurrencyLabel.layer.borderWidth = 1.0
        foreignCurrencyLabel.layer.cornerRadius = 5
    }
    
    fileprivate func createPickerView() {
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 200))
        pickerView.showsSelectionIndicator = true
        pickerView.backgroundColor = ColorScheme.pickerBackgroundColor
        pickerView.delegate = self
        
        let toolBar = UIToolbar()
        toolBar.barStyle = .default
        toolBar.tintColor = ColorScheme.toolBarTintColor
        toolBar.sizeToFit()
        
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .done, target: self, action: #selector(cancelPicker))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(donePicker))
        
        toolBar.setItems([cancelButton, spaceButton, doneButton], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        selectCountryTextField.inputView = pickerView
        selectCountryTextField.inputAccessoryView = toolBar
    }
    
    @objc fileprivate func cancelPicker() {
        selectCountryTextField.resignFirstResponder()
    }
    
    @objc fileprivate func donePicker() {
        let selectedIndex = self.pickerView.selectedRow(inComponent: 0)
        let selectedCountry = Country(rawValue: selectedIndex)

        selectCountryTextField.text = selectedCountry?.description
        UserDefaultsManagement.saveCountry(country: (selectedCountry?.description)!)
        UserDefaultsManagement.saveCurrency(currency: (selectedCountry?.code)!)
        viewModel.fetchData(symbol: (selectedCountry?.code)!)
        
        selectCountryTextField.resignFirstResponder()
    }
    
    fileprivate func handleLoadError(_ error: Error) {
        print("Dashboard Error: \(error.localizedDescription)")
        switch error {
            case ApiError.network(let innerError as NSError):
                // check for domain
                if innerError.domain != NSURLErrorDomain {
                    break
                }
                // check the code:
                if innerError.code == NSURLErrorNotConnectedToInternet {
                    showNotConnectedBanner()
                    return
                }
            case ApiError.apiProvidedError(reason: error.localizedDescription),
                 ApiError.objectSerializationError(reason: error.localizedDescription),
                 ApiError.jsonError(reason: error.localizedDescription):
                print("Other Error: \(error.localizedDescription)")
                presentAlertMessage(title: "Server Error", message: "Problem fetching data from the server. Please try again later.")
                return
            default:
                break
        }
    }

    
    fileprivate func showNotConnectedBanner() {
        // check for existing banner
        if let existingBanner = self.errorBanner {
            existingBanner.dismiss()
        }
        
        // show not connected error & tell them to try again when they do have a connection
        self.errorBanner = Banner(title: "No Internet Connection",
                                  subtitle: "Couldn't fetch data from server." +
            " Try again when you're connected to the internet",
                                  image: nil,
                                  backgroundColor: .red)
        self.errorBanner?.dismissesOnSwipe = true
        self.errorBanner?.show(duration: nil)
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Country.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Country(rawValue: row)?.description
    }
}

extension MainViewController: MainViewControllerModelDelegate {
    func didReceiveDataUpdate(items: CurrencyDetailsViewModel) {
        self.exchangeRateLabel.text = items.exchangeRate
        self.timeStampLabel.text = items.timeStamp
        self.foreignCurrencyLabel.text = items.foreignCurrency
    }
    
    func didFailDataUpdateWithError(error: Error) {
        handleLoadError(error)
    }
}

extension MainViewController {
    
    // MARK: Helper
    
    func presentAlertMessage(title: String, message: String) -> Void {
        let alert = CDAlertView(title: title, message: message, type: .error)
        let action = CDAlertViewAction(title: "OK")
        alert.add(action: action)
        alert.show()
    }
}
