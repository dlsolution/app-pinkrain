//
//  LoginViewController.swift
//  PinkRain
//
//  Created by Duy Linh on 8/14/20.
//  Copyright © 2020 dlsolution. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
        passwordTextField.delegate = self

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        self.hideKeyboardWhenTappedAround()
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc func adjustForKeyboard(notification: Notification) {
        guard let keyboardValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }

        let keyboardScreenEndFrame = keyboardValue.cgRectValue
        let keyboardViewEndFrame = view.convert(keyboardScreenEndFrame, from: view.window)

        if notification.name == UIResponder.keyboardWillHideNotification {
            scrollView.contentInset = .zero
        } else {
            scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardViewEndFrame.height - view.safeAreaInsets.bottom, right: 0)
        }

        scrollView.scrollIndicatorInsets = scrollView.contentInset

        // That example code is for adjusting text views. If you want it to apply to a regular scroll view, just take out the last two lines - they are in there so that the text view readjusts itself so the user doesn't lose their place while editing.
        // let selectedRange = scrollView.selectedRange
        // scrollView.scrollRangeToVisible(selectedRange)
    }

    @IBAction func back(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}

// MARK: - UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
