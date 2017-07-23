//
//  MainViewController.swift
//  YVTextField
//
//  Created by Yevhenii Veretennikov on 7/20/17.
//
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var firstNameTF: YVTextField!
    @IBOutlet weak var lastNameTF: YVTextField!
    @IBOutlet weak var descriptionTF: YVTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(endEdit)))
        
        firstNameTF.delegate = self
        lastNameTF.delegate = self
        descriptionTF.delegate = self
        
        // Initialization
        let tf = YVTextField()
        tf.frame = CGRect(x: 60, y: 400, width: 200, height: 30)
        
        // Setting up small placeholder
        tf.smallPlaceholderColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
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
        tf.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        
        tf.textLeftOffst = 8
        
        tf.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        tf.delegate = self
        tf.placeholder = "Custom informtion"
        tf.placeholderColor = .lightGray
        
        view.addSubview(tf)
        
    }

    func endEdit() {
        view.endEditing(true)
    }
    
}


extension MainViewController: UITextFieldDelegate {
    
    
    
}
