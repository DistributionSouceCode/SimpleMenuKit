# SimpleMenuKit

[![CI Status](http://img.shields.io/travis/seyhagithub/SimpleMenuKit.svg?style=flat)](https://travis-ci.org/seyhagithub/SimpleMenuKit)
[![Version](https://img.shields.io/cocoapods/v/SimpleMenuKit.svg?style=flat)](http://cocoapods.org/pods/SimpleMenuKit)
[![License](https://img.shields.io/cocoapods/l/SimpleMenuKit.svg?style=flat)](http://cocoapods.org/pods/SimpleMenuKit)
[![Platform](https://img.shields.io/cocoapods/p/SimpleMenuKit.svg?style=flat)](http://cocoapods.org/pods/SimpleMenuKit)

## Preview Samples
<p align="center">
<img src="https://github.com/DistributionSouceCode/SimpleMenuKit/blob/master/Example/SimpleMenuKit/menukit.gif" width="350" align="left" />
</p>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SimpleMenuKit is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'SimpleMenuKit'
```

## Usage
- Step1 : Conform ViewController that is home view controller with protocol ```MKHomeViewControllerDelegate``` then u can implement menuDelegate like this ``` weak var menuDelegate: MKActionViewControllerDelegate?``` and menu action ``` menuDelegate?.toggleLeftPanel()```
- Step2: Init your main view controller with left view controller and home view controller:
```
let menuSide = LeftTableViewController() // Create your left menu by your own
let home = ViewController()

let mainViewController = MKWrapperViewController({
return menuSide
}, mkHomeViewController: home)


window?.rootViewController = mainViewController

```
### Note
This library is under development

## Author

seyhagithub, hiemseyha168@gmail.com

## License

SimpleMenuKit is available under the MIT license. See the LICENSE file for more info.
