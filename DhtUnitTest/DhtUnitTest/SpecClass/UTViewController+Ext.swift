//
//  UIVIewController+Extension.swift
//  DhtUnitTest
//
//  Created by Nguyen Van Dung on 5/12/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import Foundation
import UIKit

public extension UIViewController {
    public func outlet<T>() -> (String) -> T? {
        return { (expectedOutlet: String) -> T? in

            guard let obj = self.outlet()(expectedOutlet)
                else { return nil }
            guard let objectOfType = obj as? T else {
                failure(message: "\(obj) outlet was not a \(T.self)")
                return nil
            }
            
            return objectOfType
        }
    }

    public func outlet() -> (String) -> Any? {
        return { (outlet: String) -> Any? in
            guard let object = self.value(forKey: outlet)
                else { return nil }

            return object
        }
    }

    public func action() -> (String, _ from: String) -> Void {
        return { (expectedAction: String, expectedOutlet: String) in

            let optionalControl = self.outlet()(expectedOutlet)
            var target: Any?
            var action: String?

            if let control = optionalControl {
                switch control {
                case let button as UIBarButtonItem:
                    target = button.target
                    action = button.action?.description
                case let control as UIControl:
                    target = control.allTargets.first
                    var allActions = [String]()
                    for event: UIControlEvents in [.touchUpInside, .valueChanged] {
                        if let target = target {
                            allActions += control.actions(forTarget: target, forControlEvent: event) ?? []
                        }
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
}
