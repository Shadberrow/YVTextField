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
    
    @IBInspectable public var separatorLineViewColor: UIColor = .black {
        didSet {
            separatorLineView.backgroundColor = separatorLineViewColor
        }
    }
    
    @IBInspectable public var isSeparatorHidden: Bool = false {
        didSet {
            separatorLineView.isHidden = isSeparatorHidden
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
    
    fileprivate lazy var separatorLineView: UIView = {
        let view = UIView()
        return view
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
        
        smallPlaceholderLabel.frame = CGRect(x: leftTextOffset, y: -verticalPadding, width: frame.width, height: 14)
        separatorLineView.frame = CGRect(x: 0, y: frame.height, width: frame.width, height: 1)
        
        hideSmallPlaceholder()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Setup view
    
    fileprivate func setupView() {
        clipsToBounds = false
        setupObservers()
        setupSubviews()
    }
    
    fileprivate func setupObservers() {
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidEndEditing), name: .UITextFieldTextDidEndEditing, object: self)
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidBeginEditing), name: .UITextFieldTextDidBeginEditing, object: self)
//        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidBeginEditing), name: .UITextFieldTextDidChange, object: self)
    }
    
    fileprivate func setupSubviews() {
        addSubview(smallPlaceholderLabel)
        addSubview(separatorLineView)
    }
    
    // MARK: - TextField Editing Observer
    func textFieldTextDidEndEditing(notification : NSNotification) {
        smallPlaceholderLabel.textColor = .blue
        hideSmallPlaceholder()
    }
    
    func textFieldTextDidBeginEditing(notification : NSNotification) {
        smallPlaceholderLabel.textColor = .red
        showSmallPlaceholder()
    }
    
    // MARK: - Animations
    
    fileprivate func hideSmallPlaceholder() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: { 
            self.smallPlaceholderLabel.transform = CGAffineTransform(translationX: 0, y: self.smallPlaceholderLabel.frame.height)
            self.smallPlaceholderLabel.alpha = 0
        }, completion: nil)
    }
    
    fileprivate func showSmallPlaceholder() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.smallPlaceholderLabel.transform = .identity
            self.smallPlaceholderLabel.alpha = 1
        }, completion: nil)
    }
    
}
















































