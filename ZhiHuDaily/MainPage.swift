//
//  MainPage.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/3/29.
//

import Foundation
import UIKit
import SwiftyJSON
import SnapKit
import SwiftDate

class MainPage : UIViewController, UITableViewDelegate, UITableViewDataSource{
    let identifier = "reusedCell"
    lazy var tableView = UITableView()
    lazy var navigateBar = CustomizeNavigateBar()
    var download = Download()
    var news:JSON!
    var storytitle = [String]()
    var storyhint = [String]()
    var topTitle = [String]()
    var tophint = [String]()
    var date = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.getLast()
        self.initView()
        
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

extension MainPage{
    func initView(){
        let screenRect = UIScreen.main.bounds.size
        
        let tableRect = CGRect(x: 0, y: 140, width: screenRect.width, height: screenRect.height-140)
        self.tableView = UITableView(frame: tableRect)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
       
        
        self.navigateBar = CustomizeNavigateBar(frame: CGRect(x: 0, y: 30, width: screenRect.width, height: 90))
        
        self.view.addSubview(self.navigateBar)
        self.view.addSubview(self.tableView)
        self.view.backgroundColor = .systemBackground
        
    }
    
    func getLast(){
        download.getLast("https://news-at.zhihu.com/api/3/news/latest") { (news) in
            self.news = news
            for story in news["stories"].arrayValue{
//                print(story["title"].stringValue+" "+story["hint"].stringValue)
                self.storytitle.append(story["title"].stringValue)
                self.storyhint.append(story["hint"].stringValue)
            }
            for story in news["top_stories"].arrayValue{
                self.topTitle.append(story["top_stories"].stringValue)
                self.tophint.append(story["top_stories"].stringValue)
            }
            
            self.tableView.reloadData()
        }
        
    }
    
    func getBefore(_ date:String){
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storytitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = (tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomizeUITableViewCell) ?? CustomizeUITableViewCell(style: .default, reuseIdentifier: identifier)
        
        cell.title.text = self.storytitle[indexPath.row]
//        cell.title.font = UIFont(name: self.arr[indexPath.row], size: 17)
        cell.hint.text = self.storyhint[indexPath.row]
        
        let cellImageView = UIImageView()
        
        let urlString = self.news["stories"].arrayValue[indexPath.row]["images"][0].stringValue
        
        debugPrint(urlString)
        
        cellImageView.downloadedFrom(imageurl: urlString)
        cellImageView.frame.size = CGSize(width: 60, height: 60)
        cellImageView.contentMode = .scaleAspectFit
        cell.accessoryView = cellImageView
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        debugPrint("tapped\(indexPath.row)")
        let url = self.news["stories"].arrayValue[indexPath.row]["url"].stringValue
        present(ReadPage(url), animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    
    func numberOfSectionsInTableView(
      tableView: UITableView) -> Int {
        return 2
    }
    
}

