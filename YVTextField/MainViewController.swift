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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEdit)))
        
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
    
}


extension MainViewController: UITextFieldDelegate {
    // do textfield delegate here
}

extension UIColor {
    convenience public init(hex: Int) {
        self.init(red: CGFloat(hex>>16 & 0xFF)/255, green: CGFloat(hex>>8 & 0xFF)/255, blue: CGFloat(hex & 0xFF)/255, alpha: 1)
    }
}
