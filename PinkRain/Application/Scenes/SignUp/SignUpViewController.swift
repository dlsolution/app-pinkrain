//
//  SignUpViewController.swift
//  PinkRain
//
//  Created by Duy Linh on 8/14/20.
//  Copyright © 2020 dlsolution. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var termsOfUseTextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.delegate = self
        phoneTextField.delegate = self

        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillHideNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(adjustForKeyboard), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)

        termsOfUseTextView.delegate = self
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        let attributes = [NSAttributedString.Key.paragraphStyle: paragraphStyle]

        let attributedString = NSMutableAttributedString(string: "By creating an account you agree with our Terms of Use.", attributes: attributes)

        let str = NSString(string: "By creating an account you agree with our Terms of Use.")
        let range = str.range(of: "Terms of Use.")
        attributedString.addAttribute(.link, value: "https://www.hackingwithswift.com", range: range)

        termsOfUseTextView.attributedText = attributedString

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

// MARK: - UITextViewDelegate
extension SignUpViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL)
        return false
    }
}

// MARK: - UITextFieldDelegate
extension SignUpViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
