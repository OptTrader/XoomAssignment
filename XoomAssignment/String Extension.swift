//
//  String Extension.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/30/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//
//  https://stackoverflow.com/questions/32501627/stringbyappendingpathcomponent-is-unavailable

import Foundation

extension String {
    func stringByAppendingPathComponent(path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
}
