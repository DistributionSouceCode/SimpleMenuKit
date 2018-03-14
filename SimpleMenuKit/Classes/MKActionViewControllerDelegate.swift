//
//  MKActionViewControllerDelegate.swift
//  Pods-SimpleMenuKit_Example
//
//  Created by Hiem Seyha on 3/14/18.
//

import Foundation

public protocol MKActionViewControllerDelegate: class {
   func toggleLeftPanel()
   func addLeftPanelViewController()
   func animateLeftPanel(shouldExpand: Bool)
}
