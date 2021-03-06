# YVTextField

[![Build Status](https://travis-ci.org/Shadberrow/YVTextField.svg?branch=master)](https://travis-ci.org/Shadberrow/YVTextField)
[![Platform](https://img.shields.io/badge/platform-ios-lightgray.svg)](https://img.shields.io/badge/platform-ios-lightgray.svg)
[![Swift version](https://img.shields.io/badge/swift-3.0-orange.svg)](https://img.shields.io/badge/swift-3.0-orange.svg)
[![Twitter URL](https://img.shields.io/badge/twitter-@Shadberrow-blue.svg)](https://twitter.com/Shadberrow)

## Introduction

Custom UITextField written in Swift.

Using a *floating label* textfield gives an opportunity to avoid additional information labels.
The main advantage is that the user keeps the field’s context after they’ve focused and entered a value.
This provides for a more accessible, less frustrating experience.

## Requirements

- iOS 8.0+
- Xcode 8.1, 8.2, 8.3, and 9.0
- Swift 3.0, 3.1, 3.2, and 4.0

## Features

- Much cleaner experience.
- Flexible customization.
- Invalid input handling.
- Individual color palette.

## Usage

#### Programmatically

```swift
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

view.addSubview(tf)
```
Result:

![](https://github.com/Shadberrow/YVTextField/blob/master/YVTextField/Resources/gif1.gif)

#### Storyboard

Basic implementation:

Drag and drop `UITextField` component to your storyboard.

After that go to the component's `Identity inspector` and type `YVTextField` in Class block.

Than go to the `Attributes inspector` and you will see next:

![](https://github.com/Shadberrow/YVTextField/blob/master/YVTextField/Resources/params.png)

## Customizing

In general all customising properties are shown in [example](#programmatically) above.

Here is the list of them all with default values:

```swift
public var smallPlaceholderText: String = ""
public var smallPlaceholderColor: UIColor = .lightGray
public var smallPlaceholderPadding: CGFloat = 7
public var smallPlaceholderLeftOffset: CGFloat = 0
public var placeholderColor: UIColor = .gray
public var separatorLineViewColor: UIColor = .lightGray
public var separatorLeftPadding: CGFloat = 0
public var separatorRightPadding: CGFloat = 0
public var separatorBottomPadding: CGFloat = 0
public var separatorIsHidden: Bool = false
public var cornerRadius: CGFloat = 0
public var borderWidth: CGFloat = 0
public var borderColor: UIColor =  .clear
public var textLeftOffst: CGFloat = 0
public var image: UIImage?
public var isHighlightedOnEdit: Bool = false
public var highlightedColor: UIColor = UIColor.red
public var errorMessage: String?
public var errorColor: UIColor = UIColor.red
```

## Enable/disable highlighting

You could change it directly from storyboard simply toggled `isHighlightedOnEdit` parameter to `off` to disable or `on` to enable highlighting.

Or programmatically:

```swift
yourTextField.isHighlightedOnEdit = true // to enable
yourTextField.isHighlightedOnEdit = false // to disable
```
## Wrong input handling

For handling wrong input you have to implement `UITextFieldDelegate` methods, simply assign in your `UIViewController`:
```swift
yourTextField.delegate = self
```
And than implement, for example, `textFieldDidEndEditing(_:)` method:
```swift
func textFieldDidEndEditing(_ textField: UITextField) {
    if textField == nicknameTF {
        guard let text = textField.text else { return }
        if text.characters.count < 5 {
            nicknameTF.errorMessage = "The nickname must be at least 5 characters."
        } else if text.characters.count > 30 {
            nicknameTF.errorMessage = "The nickname may not be greater than 35 characters."
        } else {
            nicknameTF.errorMessage = nil
        }
    }
}
```
As a result you have checked whether user entered fewer or more characters than needed.
![](https://github.com/Shadberrow/YVTextField/blob/master/YVTextField/Resources/gif2.gif)

Or check input text while typing in `textField(_:shouldChangeCharactersIn:replacementString:)` method.
```swift
func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    if textField == emailTF {
        guard let email = textField.text else { return false }
        emailTF.errorMessage = isEmailValid(email: email+string) ? nil : "The email must be valid email address"
    }
    return true
}

func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == emailTF {
        textField.resignFirstResponder()
    }
    return true
}
```
![](https://github.com/Shadberrow/YVTextField/blob/master/YVTextField/Resources/gif3.gif)

## Install (iOS 8+)

Simply drag and drop [VTextField.swift](https://github.com/Shadberrow/YVTextField/blob/master/YVTextField/YVTextField.swift) to your project.

