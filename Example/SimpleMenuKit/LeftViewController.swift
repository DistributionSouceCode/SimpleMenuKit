//
//  LeftTableViewController.swift
//  SimpleMenuKit_Example
//
//  Created by Hiem Seyha on 3/14/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class LeftViewController: UIViewController {
   
   lazy var tableView: UITableView = {
      let myTableView = UITableView()
      myTableView.backgroundColor = .clear
      myTableView.tableFooterView = UIView()
      myTableView.register(UITableViewCell.self, forCellReuseIdentifier: MenuLeftDataSource.Id)
      myTableView.rowHeight = 60
      return myTableView
   }()
   
   lazy var profileImage: UIImageView = {
      let width = self.view.frame.width / 2.5
      let imageFrame = CGRect(x: 0, y: 0, width: width, height: width)
      let imageView = UIImageView(frame: imageFrame)
      imageView.contentMode = .scaleToFill
      return imageView
   }()
   
   var menuDataSource: MenuLeftDataSource?
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      let menuList = ["Manage Account","Change Language", "Change Theme", "Logout"]
      menuDataSource = MenuLeftDataSource(dataSource: menuList)
      
      setupBackgroundImage(with: view, image: "background")
      setupVisualEffect()
      setupImageProfile()
      setupShadowView(with: profileImage)
      setupTableView()
      
      
   }
   
   
   fileprivate func setupVisualEffect() {
      
      let blurEffect = UIBlurEffect(style:.light)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
      blurEffectView.frame = view.bounds
      blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      view.addSubview(blurEffectView)
   }
   
   fileprivate func setupImageProfile() {
      
      let image = UIImage(named: "profile")
      profileImage.image = image
      profileImage.circle()
      
   }
   
   fileprivate func setupTableView() {
      
      view.addSubview(tableView)
      let parentFrame = profileImage.frame.height + 120
      let tableViewFrame = CGRect(x: 0, y: profileImage.frame.height + 120, width: self.view.frame.width, height: self.view.frame.height - parentFrame )
      tableView.frame = tableViewFrame
      tableView.dataSource = menuDataSource
   }
   
   fileprivate func setupShadowView(with imageView: UIImageView) {
      let shadowView = UIView(frame: imageView.frame)
      shadowView.frame.origin = CGPoint(x: 20, y: 80)
      shadowView.clipsToBounds = false
      shadowView.layer.shadowColor = UIColor.black.cgColor
      shadowView.layer.shadowOpacity = 1
      shadowView.layer.shadowOffset = CGSize.zero
      shadowView.layer.shadowRadius = 10
      shadowView.layer.shadowPath = UIBezierPath(roundedRect: shadowView.bounds, cornerRadius: imageView.frame.width / 2).cgPath
      shadowView.addSubview(imageView)
      view.addSubview(shadowView)
   }
}


fileprivate extension UIImageView {
   
   func circle() {
      self.layer.cornerRadius = self.frame.width / 2
      self.clipsToBounds = true
   }
}


func setupBackgroundImage(with view: UIView, image: String, alpha: CGFloat = 1.0) {
   let imageView = UIImageView(frame: view.bounds)
   let bgImage = UIImage(named: image)
   imageView.image = bgImage
   imageView.contentMode = .scaleAspectFill
   imageView.clipsToBounds = true
   imageView.alpha = alpha
   view.addSubview(imageView)
}



