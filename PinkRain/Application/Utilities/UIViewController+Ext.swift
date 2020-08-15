//
//  UIViewController+Ext.swift
//  PinkRain
//
//  Created by Duy Linh on 8/15/20.
//  Copyright © 2020 dlsolution. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
