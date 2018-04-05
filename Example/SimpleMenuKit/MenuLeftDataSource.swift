//
//  MenuLeftDataSource.swift
//  SimpleMenuKit_Example
//
//  Created by Hiem Seyha on 4/5/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

class MenuLeftDataSource: NSObject, UITableViewDataSource {
   
   let dataSource:[String]
   
   init(dataSource: [String]) {
      self.dataSource = dataSource
   }
   
   func numberOfSections(in tableView: UITableView) -> Int {
      return 1
   }
   
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return dataSource.count
   }

   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: MenuLeftDataSource.Id)!
      cell.backgroundColor = .clear
      cell.tintColor = .white
      cell.selectionStyle = .none
      cell.textLabel?.text = dataSource[indexPath.row]
      return cell
      
   }
   
   static var Id : String  {
      return "CellId"
   }

}
