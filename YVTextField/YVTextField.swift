//
//  YVTextField.swift
//  YVTextField
//
//  Created by Yevhenii Veretennikov on 7/20/17.
//
//

import Foundation
import UIKit

@IBDesignable
class YVTextField: UITextField {
    
    // MARK: - IBInspectables
    
    @IBInspectable var smallPlaceholder: String = "" {
        didSet {
            smallPlaceholderLabel.text = smallPlaceholder
        }
    }
    
    @IBInspectable var smallPlaceholderColor: UIColor = .lightGray {
        didSet {
            smallPlaceholderLabel.textColor = smallPlaceholderColor
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor: UIColor =  .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var leftTextOffset: CGFloat = 0 {
        didSet {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: leftTextOffset, height: frame.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    // MARK: - Views
    
    fileprivate lazy var smallPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = self.textColor
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        smallPlaceholderLabel.frame = CGRect(x: leftTextOffset, y: -14, width: frame.width, height: 14)
    }
    
    fileprivate func setupView() {
        clipsToBounds = false
        
        setupConstraints()
    }
    
    fileprivate func setupConstraints() {
        addSubview(smallPlaceholderLabel)
        
    }
    
}
















































