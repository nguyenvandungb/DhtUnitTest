//
//  TransactionSpec.swift
//  DhtUnitTest
//
//  Created by Nguyen Van Dung on 5/13/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import Foundation
import Quick
import Nimble
@testable import DhtUnitTest

class TransactionSpec: QuickSpec {
    override func spec() {
        describe("Transaction") { 
            var viewController: AuthenViewController!
            var navigationController: UINavigationController!

            beforeEach {
                viewController = UIStoryboard.main().instantiateViewController(withIdentifier: "AuthenViewController") as! AuthenViewController
                navigationController = UIStoryboard.main().instantiateInitialViewController() as! UINavigationController
                navigationController.pushViewController(viewController, animated: false)
                //wake up
                viewController.loadView()
                expect(viewController.view).notTo(beNil())
            }

            describe("User wants to log in", { 
                it("taps Login") {
                    viewController.actionLogin(self)
                    //toEventually here to wait for the transition animation
                    expect(navigationController.visibleViewController).toEventually(beAKindOf(LoginViewController.self))
                }
            })

            describe("User wants to register", { 
                it("taps Register") {
                    viewController.actionRegister(self)
                    expect(navigationController.visibleViewController).toEventually(beAKindOf(RegisterViewController.self))
                }
            })
        }
    }
}
