//
//  ViewController.swift
//  DhtUnitTest
//
//  Created by Nguyen Van Dung on 5/5/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import UIKit
import XCTest

class ViewController: BaseViewController {
    
    @IBOutlet weak var testBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func checkGUIElements() -> Bool {
        // Check IBOutlet
        XCTAssertNotNil(self.testBtn, "Label could not be nil")
        return true
    }

    @IBAction func testAction(_ sender: Any) {
        print(NSStringFromClass(self.classForCoder) + "." + #function)
    }

    func makeTestRequest() {
        
    }
}

