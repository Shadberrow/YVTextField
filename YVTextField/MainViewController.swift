//
//  MainViewController.swift
//  YVTextField
//
//  Created by Yevhenii Veretennikov on 7/20/17.
//
//

import UIKit
import Foundation

class MainViewController: UIViewController {
    
    @IBOutlet weak var emailTF: YVTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEdit)))

        emailTF.delegate = self
        
        // Initialization
        let tf = YVTextField()
        tf.frame = CGRect(x: 60, y: 200, width: view.frame.width - 120, height: 40)
        
        // Setting highlighting functionality
        tf.isHighlightedOnEdit = true
        tf.highlightedColor = UIColor(hex: 0xFF8766)
        
        // Setting up small placeholder
        tf.smallPlaceholderColor = UIColor(hex: 0xB26B58)
        tf.smallPlaceholderFont = UIFont.systemFont(ofSize: 12)
        tf.smallPlaceholderText = "Enter your first name"
        tf.smallPlaceholderPadding = 12
        tf.smallPlaceholderLeftOffset = 0
        
        // Settign up separator line
        tf.separatorIsHidden = false
        tf.separatorLineViewColor = tf.smallPlaceholderColor
        tf.separatorLeftPadding = -8
        tf.separatorRightPadding = -8
        
        // Add image
        tf.image = #imageLiteral(resourceName: "user")
        tf.tintColor = UIColor(hex: 0x46B292)
        
        // Customize placeholder
        tf.placeholder = "Your name"
        tf.placeholderColor = UIColor(hex: 0x422821)
        
        tf.textColor = UIColor(hex: 0x46B292)
        tf.font = UIFont(name: "HelveticaNeue-Light", size: 17)
        tf.delegate = self
        
        tf.isHighlightedOnEdit = true
        
//        view.addSubview(tf)
        
    }

    func endEdit() {
        view.endEditing(true)
    }
    
    func isEmailValid(email: String) -> Bool {
        var string = email
        
        if let lastCharacter = email.characters.last?.description {
            if let unicodeValue = UnicodeScalar(lastCharacter) {
                if !CharacterSet.letters.contains(unicodeValue) && !CharacterSet.decimalDigits.contains(unicodeValue) {
                    string = string.substring(to: string.index(before: string.endIndex))
                }
            }
        }
        
        
        if !string.contains("@") { return false }
        else if string.hasSuffix("gmail.com") { return true }
        else if string.hasSuffix("bk.ru") { return true }
        else if string.hasSuffix("outlook.com") { return true }
        else if string.hasSuffix("icloud.com") { return true }
        else { return false }
    }
    
}


extension MainViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField == emailTF {
            guard let email = textField.text else { return false }
            let emailString = !(range.length == 1) ? email + string : email + "0"
            emailTF.errorMessage = isEmailValid(email: emailString) ? nil : "The email must be valid email address"
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == emailTF {
            textField.resignFirstResponder()
        }
        return true
    }
    
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        if textField == nameTF {
//            guard let text = textField.text else { return }
//            nameTF.errorMessage = nil
//        }
//    }
    
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        if textField == nicknameTF {
//            guard let text = textField.text else { return }
//            if text.characters.count < 5 {
//                nicknameTF.errorMessage = "The nickname must be at least 5 characters."
//            } else if text.characters.count > 30 {
//                nicknameTF.errorMessage = "The nickname may not be greater than 16 characters."
//            } else {
//                nicknameTF.errorMessage = nil
//            }
//        }
//    }
    
}

extension UIColor {
    convenience public init(hex: Int) {
        self.init(red: CGFloat(hex>>16 & 0xFF)/255, green: CGFloat(hex>>8 & 0xFF)/255, blue: CGFloat(hex & 0xFF)/255, alpha: 1)
    }
}
