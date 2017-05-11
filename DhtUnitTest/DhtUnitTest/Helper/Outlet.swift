//
//  Outlet.swift
//  DhtUnitTest
//
//  Created by Nguyen Van Dung on 5/12/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import Foundation
import UIKit

public func outlet<T>(viewController: UIViewController) -> (String) -> T? {
    return { (expectedOutlet: String) -> T? in

        guard let obj = outlet(viewController: viewController)(expectedOutlet)
            else { return nil }
        guard let objectOfType = obj as? T else {
            failure(message: "\(obj) outlet was not a \(T.self)")
            return nil
        }

        return objectOfType
    }
}

func outlet(viewController: UIViewController) -> (String) -> Any? {
    return { (outlet: String) -> Any? in
        guard let object = viewController.value(forKey: outlet)
            else { return nil }

        return object
    }
}
