//
//  MainPage.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/3/29.
//

import Foundation
import UIKit

class File : UIViewController, UITableViewDelegate, UITableViewDataSource{
    // Data model: These strings will be the data for the table view cells
        let animals: [String] = ["Horse", "Cow", "Camel", "Sheep", "Goat"]
        
        // cell reuse id (cells that scroll out of view can be reused)
        let cellReuseIdentifier = "reusedCell"
        
        // don't forget to hook this up from the storyboard
        var tableView: UITableView! = UITableView(frame: CGRect(x: 0, y: 20, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))

        override func viewDidLoad() {
            super.viewDidLoad()

            // Register the table view cell class and its reuse id
            self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
            
            // (optional) include this line if you want to remove the extra empty cell divider lines
            // self.tableView.tableFooterView = UIView()

            // This view controller itself will provide the delegate methods and row data for the table view.
            tableView.delegate = self
            tableView.dataSource = self
            self.view.backgroundColor =  .systemBackground
        }
        
        // number of rows in table view
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return self.animals.count
        }
        
        // create a cell for each table view row
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            // create a new cell if needed or reuse an old one
            var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? UITableViewCell
            
            if (cell == nil) {
                cell = UITableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier)
            }
            
            // set the text from the data model
            cell?.textLabel?.text = self.animals[indexPath.row]
            
            return cell!
        }
        
        // method to run when table view cell is tapped
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("You tapped cell number \(indexPath.row).")
        }
    
}
