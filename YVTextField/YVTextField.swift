//
//  YVTextField.swift
//  YVTextField
//
//  Created by Yevhenii Veretennikov on 7/20/17.
//
//

import Foundation
import UIKit
import NotificationCenter

@IBDesignable
class YVTextField: UITextField {
    
    // MARK: - IBInspectables
    
    @IBInspectable public var smallPlaceholder: String = "" {
        didSet {
            smallPlaceholderLabel.text = smallPlaceholder
        }
    }
    
    @IBInspectable public var smallPlaceholderColor: UIColor = .lightGray {
        didSet {
            smallPlaceholderLabel.textColor = smallPlaceholderColor
        }
    }
    
    @IBInspectable public var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable public var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable public var borderColor: UIColor =  .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable public var leftTextOffset: CGFloat = 0 {
        didSet {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: leftTextOffset, height: frame.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable public var verticalPadding: CGFloat = 0
    
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
        
        smallPlaceholderLabel.frame = CGRect(x: self.leftTextOffset, y: -self.verticalPadding, width: self.frame.width, height: 14)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Setup view
    
    fileprivate func setupView() {
        clipsToBounds = false
        
        setupObservers()
        
        setupConstraints()
    }
    
    fileprivate func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidEndEditing), name: .UITextFieldTextDidEndEditing, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidBeginEditing), name: .UITextFieldTextDidBeginEditing, object: self)
    }
    
    fileprivate func setupConstraints() {
        addSubview(smallPlaceholderLabel)
        
    }
    
    //MARK: - TextField Editing Observer
    func textFieldTextDidEndEditing(notification : NSNotification) {
        smallPlaceholderLabel.textColor = .blue
    }
    
    func textFieldTextDidBeginEditing(notification : NSNotification) {
        smallPlaceholderLabel.textColor = .red
    }
    
}
















































