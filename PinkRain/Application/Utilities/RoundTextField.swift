//
//  RoundTextfield.swift
//  PinkRain
//
//  Created by Duy Linh on 8/14/20.
//  Copyright © 2020 dlsolution. All rights reserved.
//

import UIKit

@IBDesignable
class RoundTextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet{
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            layer.borderColor = borderColor.cgColor
        }
    }
}
