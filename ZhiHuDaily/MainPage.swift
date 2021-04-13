//
//  MainPage.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/3/29.
//

import Foundation
import UIKit

class MainPage : UIViewController, UITableViewDelegate, UITableViewDataSource{
    let fullScreenSize = UIScreen.main.bounds.size
    let identifier = "reusedCell"
    lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        let screenRect = UIScreen.main.bounds
        let tableRect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height)
        tableView.frame = tableRect
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none

        self.view.addSubview(tableView)
        self.view.backgroundColor = .systemBackground
        
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension MainPage{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomizeUITableViewCell) ?? CustomizeUITableViewCell(style: .default, reuseIdentifier: identifier)
        
//        if (cell == nil) {
//            cell = UITableViewCell(frame: CGRect(x: <#T##Int#>, y: <#T##Int#>, width: <#T##Int#>, height: <#T##Int#>))
//        }
//        cell.title.text =
        
        return cell
        
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        debugPrint("tapped")
        view.backgroundColor = .yellow
    }
    
    func numberOfSectionsInTableView(
      tableView: UITableView) -> Int {
        return 1
    }
}

