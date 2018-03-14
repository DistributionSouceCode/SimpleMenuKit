//
//  ViewController.swift
//  SimpleMenuKit
//
//  Created by seyhagithub on 03/14/2018.
//  Copyright (c) 2018 seyhagithub. All rights reserved.
//

import UIKit
import SimpleMenuKit

class ViewController: UIViewController, MKHomeViewControllerDelegate {
   
   var delegate: MKActionViewControllerDelegate?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.backgroundColor = .red
      
     setupMenuButton()
      
   }
   

   fileprivate func setupMenuButton() {
      let button = UIButton(frame: CGRect(x: self.view.frame.width - 200, y: 100, width: 200, height: 200))
      button.setTitle("Menu", for: .normal)
      button.addTarget(self, action: #selector(self.presentSideMenu), for: .touchUpInside)
      
      view.addSubview(button)
   }
   
   @objc private func presentSideMenu() {
      delegate?.toggleLeftPanel()
   }
}

