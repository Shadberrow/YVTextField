# YVTextField

[![Build Status](https://travis-ci.org/Shadberrow/YVTextField.svg?branch=master)](https://travis-ci.org/Shadberrow/YVTextField)

## Introduction

Custom UITextField written in Swift 3, XCode 8.3.

iOS requirements: 8.0+

Using a *floating label* textfield gives an opportunity to avoid additional information labels.

The main advantage is that the user keeps the field’s context after they’ve focused and entered a value. This provides for a more accessible, less frustrating experience.

## Features

* Much cleaner experience.

* Flexible customization. 

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

## Enable/disable highlighting

You could change it directly from storyboard simply toggled `isHighlightedOnEdit` parameter to `off` to disable or `on` to enable highlighting.

Or programmatically:

```swift
yourTextField.isHighlightedOnEdit = true // to enable
yourTextField.isHighlightedOnEdit = false // to disable
```
## Install (iOS 8+)

Simply drag and drop [VTextField.swift](https://github.com/Shadberrow/YVTextField/blob/master/YVTextField/YVTextField.swift) to your project.

