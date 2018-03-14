//
//  MKHomeViewControllerDelegate.swift
//  Pods-SimpleMenuKit_Example
//
//  Created by Hiem Seyha on 3/14/18.
//

import Foundation

public protocol MKHomeViewControllerDelegate : class  {
   var menuDelegate: MKActionViewControllerDelegate? { get set }
}
