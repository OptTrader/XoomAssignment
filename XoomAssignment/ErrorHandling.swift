//
//  ErrorHandling.swift
//  XoomAssignment
//
//  Created by Chris Kong on 5/27/17.
//  Copyright © 2017 Chris Kong. All rights reserved.
//

import Foundation

typealias ErrorCallback = (Error) -> Void

enum ApiError: Error {
    case network(error: Error)
    case apiProvidedError(reason: String)
    case objectSerializationError(reason: String)
    case jsonError(reason: String)
}
