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
   
   weak var menuDelegate: MKActionViewControllerDelegate?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      view.backgroundColor = .black
      setupBackgroundImage(with: view, image: "frontbg", alpha: 0.5)
      setupMenuButton()
      
   }
   
   fileprivate func setupMenuButton() {
      let menuButton = UIButton()
      menuButton.setBackgroundImage(UIImage(named: "menu"), for: .normal)
      menuButton.tintColor = .black
      menuButton.addTarget(self, action: #selector(self.presentSideMenu), for: .touchUpInside)
      view.addSubview(menuButton)
      
      setupConstraint(with: menuButton)
   }
   
   fileprivate func setupConstraint(with menuButton : UIButton) {
      menuButton.translatesAutoresizingMaskIntoConstraints = false
      menuButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
      menuButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30).isActive = true
      menuButton.widthAnchor.constraint(equalToConstant: 25).isActive = true
      menuButton.heightAnchor.constraint(equalToConstant: 25).isActive = true
   }
   
   @objc private func presentSideMenu() {
      menuDelegate?.toggleLeftPanel()
   }
}

