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
        
        
        
    }

    func endEdit() {
        view.endEditing(true)
    }
    
}


extension MainViewController: UITextFieldDelegate {
    
    
    
}
