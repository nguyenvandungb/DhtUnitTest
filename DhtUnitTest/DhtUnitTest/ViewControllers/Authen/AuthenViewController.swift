//
//  LoginViewController.swift
//  DhtUnitTest
//
//  Created by Nguyen Van Dung on 5/13/17.
//  Copyright © 2017 Dht. All rights reserved.
//

import Foundation
import UIKit

class AuthenViewController: BaseViewController {

    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var btnRegister: UIButton!

    @IBAction func actionLogin(_ sender: Any) {
        if let controller = UIStoryboard.main().instantiateViewController(withIdentifier: "LoginViewController") as? LoginViewController {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }

    @IBAction func actionRegister(_ sender: Any) {
        if let controller = UIStoryboard.main().instantiateViewController(withIdentifier: "RegisterViewController") as? RegisterViewController {
            self.navigationController?.pushViewController(controller, animated: true)
        }
    }
}
