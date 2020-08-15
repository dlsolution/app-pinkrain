//
//  WelcomeViewController.swift
//  PinkRain
//
//  Created by Duy Linh on 8/14/20.
//  Copyright © 2020 dlsolution. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
    }

    @IBAction func login(_ sender: UIButton) {
        let vc = LoginViewController()
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func signUp(_ sender: UIButton) {
        let vc = SignUpViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
