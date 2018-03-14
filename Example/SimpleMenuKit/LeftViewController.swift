//
//  LeftTableViewController.swift
//  SimpleMenuKit_Example
//
//  Created by Hiem Seyha on 3/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

 class LeftViewController: UIViewController {

   override func viewDidLoad() {
        super.viewDidLoad()
      
      setupBackgroundImage()
      
      setupVisualEffect()

    }
   
   fileprivate func setupBackgroundImage() {
      
      let imageView = UIImageView(frame: self.view.bounds)
      let bgImage = UIImage(named: "background")
      imageView.image = bgImage
      view.addSubview(imageView)
   }

   fileprivate func setupVisualEffect() {
      
      let blurEffect = UIBlurEffect(style:.light)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = view.bounds
      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      view.addSubview(blurEffectView)
   }
}
