//
//  ViewControllerSpec.swift
//  DhtUnitTest
//
//  Created by Nguyen Van Dung on 5/11/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import Foundation
import Nimble
import Quick
@testable import DhtUnitTest

class ViewControllerSpec: QuickSpec {
    /**
     * Note: the variable controller is unwap option because i want check 
     * controller is existed or note
     */
    override func spec() {
        var controller: ViewController!
        var hasButtonsOutlet: ButtonOutletAssertion?
        var receivesAction: ActionAssertion!

        setupFailHandler { (message) in
            fail(message ?? "")
        }

        describe("view controller") { 
            /**
             *  This code will run before each test
             */
            beforeEach {
                //try get install of view controller in storyboard and wake up it
                controller = UIStoryboard.main().instantiateInitialViewController() as! ViewController
                /**
                 Need call this line to wake up view of view controller.
                 Make it ready to run test
                 */
                controller.loadView()
                expect(controller.view).notTo(beNil())

                setupActionValidator(validator: { (target, action, expectedAction) in
                    Logger.log(logString: "expectedAction = \(expectedAction)")
                    expect(target) === controller
                    expect(action).toNot(beNil())
                    if let action = action {
                        expect(action) == expectedAction
                    }
                })

                // Capture the new viewController instance for each test
                hasButtonsOutlet = controller.outlet()
                receivesAction = controller.action()
            }

            /**
             * IBOutlet has conntected or not
             */
            it ("has a testBtn outlet") {
                _ = hasButtonsOutlet?("testBtn")
            }

            /**
             * Check UIControl/UIbarButtonItem has right action in target
             */
            it("receives a testAction: action from testBtn", closure: { 
                receivesAction?("testAction:", "testBtn")
            })

            // Test action of button
            describe("Tap on test button") {
                beforeEach {
                    controller.testBtn.sendActions(for: .touchUpInside)
                }
                
                it("makes a test request", closure: { 
                    
                })
            }
        }
    }
}
