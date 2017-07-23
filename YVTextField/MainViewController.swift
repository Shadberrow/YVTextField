//
//  MainViewController.swift
//  YVTextField
//
//  Created by Yevhenii Veretennikov on 7/20/17.
//
//

import UIKit

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEdit)))
        
        // Initialization
        let tf = YVTextField()
        tf.frame = CGRect(x: 60, y: 200, width: view.frame.width - 120, height: 30)
        
        tf.isHighlightedOnEdit = true
        
        // Setting up small placeholder
        tf.smallPlaceholderColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        tf.smallPlaceholderFont = UIFont.systemFont(ofSize: 12)
        tf.smallPlaceholderText = "Enter your information"
        tf.smallPlaceholderPadding = 12
        tf.smallPlaceholderLeftOffset = 0
        
        // Settign up separator line
        tf.separatorIsHidden = false
        tf.separatorLineViewColor = tf.smallPlaceholderColor
        tf.separatorLeftPadding = -8
        tf.separatorRightPadding = -8
        
        // Add image
        tf.image = #imageLiteral(resourceName: "user")
        tf.tintColor = UIColor(red: 243/255, green: 175/255, blue: 34/255, alpha: 1)
        
        tf.textColor = UIColor(red: 243/255, green: 175/255, blue: 34/255, alpha: 1)
        tf.delegate = self
        tf.placeholder = "Custom informtion"
        tf.placeholderColor = UIColor(red: 61/255, green: 172/255, blue: 247/255, alpha: 1)
        
        view.addSubview(tf)
        
    }

    func endEdit() {
        view.endEditing(true)
    }
    
}


extension MainViewController: UITextFieldDelegate {
    
    
    
}
