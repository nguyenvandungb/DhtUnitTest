//
//  Actions.swift
//  DhtUnitTest
//
//  Created by Nguyen Van Dung on 5/12/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import Foundation
import UIKit

public typealias ActionAssertion = (String, _ from: String) -> Void
public typealias ButtonOutletAssertion = (String) -> (UIButton?)

public func action(viewController: UIViewController) -> (String, _ from: String) -> Void {
    return { (expectedAction: String, expectedOutlet: String) in
        let optionalControl = outlet(viewController: viewController)(expectedOutlet)

        var target: Any?
        var action: String?

        if let control = optionalControl {
            switch control {
            case let button as UIBarButtonItem:
                target = button.target
                action = button.action?.description
            case let control as UIControl:
                target = control.allTargets.first!
                var allActions: [String] = []
                for event: UIControlEvents in [.touchUpInside, .valueChanged] {
                    allActions += control.actions(forTarget: target!, forControlEvent: event) ?? []
                }

                // Filter down to the expected action
                action = allActions.filter({$0 == expectedAction}).first
            default:
                failure(message: "Unhandled control type: \(type(of: control))")
            }
        }

        validate(target: target, action: action, expectedAction: expectedAction)
    }
}
