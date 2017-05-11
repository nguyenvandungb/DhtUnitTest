//
//  Validation.swift
//  DhtUnitTest
//
//  Created by Nguyen Van Dung on 5/12/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import Foundation
import UIKit

public typealias ActionValidation = (_ target: Any?, _ action: String?, _ expectedAction: String) -> Void
public typealias FailHandler = (String?) -> Void
private var failHandler: FailHandler?
private var actionValidator: ActionValidation?

public func setupFailHandler(handler: FailHandler?) {
    failHandler = handler
}

func failure(message: String?) {
    guard let handler = failHandler else {
        Logger.log(logString: "ERROR: failHandler has not been set up.")
        return
    }
    handler(message)
}

public func setupActionValidator(validator: ActionValidation?) {
    actionValidator = validator
}

func validate(target: Any?, action: String?, expectedAction: String) {
    guard let validator = actionValidator else {
        Logger.log(logString: "ERROR: actionValidator has not been set up.")
        return
    }
    validator(target, action, expectedAction)
}
