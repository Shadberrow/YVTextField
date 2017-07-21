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

@IBDesignable class YVTextField: UITextField {
    
    private var isPlaceholderHidden = false
    
    public var errorColor: UIColor = #colorLiteral(red: 0.9046222586, green: 0.06288693374, blue: 0.1854852713, alpha: 1)
    
    public var errorMessage: String? {
        didSet {
            if errorMessage!.isEmpty { return }
            smallPlaceholderLabel.text = errorMessage
            smallPlaceholderLabel.textColor = errorColor
        }
    }
    
    // MARK: - IBInspectables
    
    @IBInspectable public var smallPlaceholderText: String = "" {
        didSet {
            smallPlaceholderLabel.text = smallPlaceholderText
        }
    }
    
    ///
    @IBInspectable public var smallPlaceholderColor: UIColor = .lightGray {
        didSet {
            smallPlaceholderLabel.textColor = smallPlaceholderColor
        }
    }
    
    public var smallPlaceholderFont: UIFont = UIFont.systemFont(ofSize: 12) {
        didSet {
            smallPlaceholderLabel.font = smallPlaceholderFont
        }
    }
    
    /// Width between textfield top and small separator top
    @IBInspectable public var smallPlaceholderPadding: CGFloat = 7
    
    /// Color of the main placeholder text
    @IBInspectable public var placeholderColor: UIColor = .gray {
        didSet {
            setPlaceholderColor(to: placeholderColor)
        }
    }
    
    /// Color of the separator line view
    @IBInspectable public var separatorLineViewColor: UIColor = .black {
        didSet {
            separatorLineView.backgroundColor = separatorLineViewColor
        }
    }
    
    @IBInspectable public var separatorLeftPadding: CGFloat = 0
    @IBInspectable public var separatorRightadding: CGFloat = 0
    @IBInspectable public var separatorBottomPadding: CGFloat = 0
    
    @IBInspectable public var separatorHidden: Bool = false {
        didSet {
            separatorLineView.isHidden = separatorHidden
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
    
    // MARK: - Views
    
    fileprivate lazy var smallPlaceholderLabel: UILabel = {
        let label = UILabel()
        label.textColor = self.textColor
        label.font = self.smallPlaceholderFont
        label.textColor = self.smallPlaceholderColor
        return label
    }()
    
    fileprivate lazy var separatorLineView: UIView = {
        let view = UIView()
        view.backgroundColor = self.separatorLineViewColor
        view.isHidden = self.separatorHidden
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
        
        clipsToBounds = false
        
        if font == nil { return }
        
        smallPlaceholderFont = UIFont.systemFont(ofSize: font!.pointSize * 0.7)
        
        smallPlaceholderLabel.frame = CGRect(x: leftTextOffset,
                                             y: -smallPlaceholderPadding,
                                             width: frame.width,
                                             height: font!.pointSize * 1.1)
        
        separatorLineView.frame = CGRect(x: separatorLeftPadding,
                                         y: frame.height - separatorBottomPadding,
                                         width: frame.width - separatorLeftPadding - separatorRightadding,
                                         height: 1)
        
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
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextChanged), name: .UITextFieldTextDidChange, object: self)
    }
    
    fileprivate func setupSubviews() {
        addSubview(smallPlaceholderLabel)
        addSubview(separatorLineView)
    }
    
    // MARK: - TextField Editing Observer
    
    func textFieldTextDidEndEditing(notification : NSNotification) {
        guard let text = text else { return }
        if text.isEmpty {
            hideSmallPlaceholder()
            setPlaceholderColor(to: placeholderColor)
        }
    }
    
    func textFieldTextDidBeginEditing(notification : NSNotification) {
        showSmallPlaceholder()
        setPlaceholderColor(to: .clear)
    }
    
    func textFieldTextChanged(notifcation: NSNotification) {
        if !(errorMessage != nil && !errorMessage!.isEmpty) {
            smallPlaceholderLabel.text = smallPlaceholderText
            smallPlaceholderLabel.textColor = smallPlaceholderColor
        }
    }
    
    // MARK: - Animations
    
    fileprivate func hideSmallPlaceholder() {
        if !isPlaceholderHidden {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.smallPlaceholderLabel.transform = CGAffineTransform(translationX: 0, y: self.smallPlaceholderLabel.frame.height)
                self.smallPlaceholderLabel.alpha = 0
            }) { (_) in
                self.isPlaceholderHidden = !self.isPlaceholderHidden
            }
        }
    }
    
    fileprivate func showSmallPlaceholder() {
        if isPlaceholderHidden {
            UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.smallPlaceholderLabel.transform = .identity
                self.smallPlaceholderLabel.alpha = 1
            }) { (_) in
                self.isPlaceholderHidden = !self.isPlaceholderHidden
            }
        }
    }
    
    // MARK: - Helpers
    
    fileprivate func setPlaceholderColor(to: UIColor) {
        attributedPlaceholder = NSAttributedString(string: placeholder!, attributes: [NSForegroundColorAttributeName: to])
    }
    
    // MSRK: - Public methods
    
    public func wrongInput() {
        smallPlaceholderLabel.textColor = errorColor
    }
    
}
















































