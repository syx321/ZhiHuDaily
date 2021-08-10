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
    lazy var navigateBar =  CustomizeNavigateBar()
    var download = Download()
    var news:JSON!
    var storytitle = [String]()
    var storyhint = [String]()
    var topTitle = [String]()
    var tophint = [String]()
    var date = Date()
    var dayBefore = 0

    override func viewDidLoad() {
        super.viewDidLoad()
            
        self.getLast()
        self.initView()
//        dayBefore += 1
//        self.getBefore(Date(components: date.dateComponents, region: date.dateByAdding(dayBefore, .day).region)!)

        
       }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}


//MARK: - TableViewConfiguration
extension MainPage{
    func initView(){
        let screenRect = UIScreen.main.bounds.size
        
        let tableRect = CGRect(x: 0, y: 100, width: screenRect.width, height: screenRect.height-100)
        self.tableView = UITableView(frame: tableRect)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
       
        self.navigateBar = CustomizeNavigateBar(frame: CGRect(x: 0, y: 10, width: screenRect.width, height: 80))
        
        self.view.addSubview(self.navigateBar)
        self.view.addSubview(self.tableView)
        self.view.backgroundColor = .systemBackground
        
        
        let China = Region(calendar: Calendars.gregorian, zone: Zones.asiaShanghai, locale: Locales.chineseChina)
        SwiftDate.defaultRegion = China
        
    }
    
    //初始化时得到今天的内容
    func getLast(){
        download.getContent("https://news-at.zhihu.com/api/3/news/latest") { (new) in
            self.news = new
            for story in new["stories"].arrayValue{
//                print(story["title"].stringValue+" "+story["hint"].stringValue)
                self.storytitle.append(story["title"].stringValue)
                self.storyhint.append(story["hint"].stringValue)
//                debugPrint(self.storytitle.count)
            }
            for story in new["top_stories"].arrayValue{
                self.topTitle.append(story["top_stories"].stringValue)
                self.tophint.append(story["top_stories"].stringValue)
            }
            
            self.tableView.reloadData()
        }
        
    }
    
    //根据用户滑动加载之前的内容
    func getBefore(_ date:Date){

        let month = date.month.description.count == 1 ? "0"+date.month.description : date.month.description
        let day = date.day.description.count == 1 ? "0"+date.day.description : date.day.description
        
        let api = "https://news-at.zhihu.com/api/3/stories/before/"+date.year.description+month+day

        download.getContent(api) { (new) in
            for story in new["stories"].arrayValue{
//                print(story["title"].stringValue+" "+story["hint"].stringValue)
                self.storytitle.append(story["title"].stringValue)
                self.storyhint.append(story["hint"].stringValue)
//                debugPrint(self.storytitle.count)
            }
            
            
            self.tableView.reloadData()

        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.storytitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = initCell(indexPath)
        return cell
    }
    
    func initCell(_ indexPath: IndexPath)  -> UITableViewCell {
        let cell = (tableView.dequeueReusableCell(withIdentifier: identifier) as? CustomizeUITableViewCell) ?? CustomizeUITableViewCell(style: .default, reuseIdentifier: identifier)
        
        cell.title.text = self.storytitle[indexPath.row]
        cell.hint.text = self.storyhint[indexPath.row]
        
        let cellImageView = UIImageView()
        
//        debugPrint(self.storytitle.count.description + "    " + indexPath.debugDescription)
//        debugPrint(self.news["stories"].arrayValue.count.description)
        
        let urlString = self.news["stories"].arrayValue[indexPath.row]["images"][0].stringValue
        
//        debugPrint(urlString)
        
        cellImageView.downloadedFrom(imageurl: urlString)
        cellImageView.frame.size = CGSize(width: 80, height: 80)
        cellImageView.contentMode = .scaleAspectFit
        cell.accessoryView = cellImageView
        
        return cell
    }
    

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = self.tableView.cellForRow(at: indexPath)
        cell?.selectionStyle = .none
        debugPrint("tapped\(indexPath.row)")
        let url = self.news["stories"].arrayValue[indexPath.row]["url"].stringValue
//        present(ReadPage(url), animated: true, completion: nil)
        let viewController = ReadPage(url)
        self.navigationController?.pushViewController(viewController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    
    func numberOfSectionsInTableView(
      tableView: UITableView) -> Int {
        return 2
    }
    
}

