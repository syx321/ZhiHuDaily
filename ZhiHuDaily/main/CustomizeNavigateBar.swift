//
//  CustomeizeNavigateBar.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/4/23.
//

import Foundation
import SnapKit
import SwiftDate

class CustomizeNavigateBar : UIView{
    var rootView = UIView()
    var date1 = UILabel()
    var date2 = UILabel()
    var greeting = UILabel()
    var user = UIImageView()
    var poweron = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        rootView.addSubview(date1)
        rootView.addSubview(date2)
        rootView.addSubview(poweron)
        rootView.addSubview(greeting)
        rootView.addSubview(user)
        self.addSubview(rootView)
        
        greeting.font = .boldSystemFont(ofSize: 18)
        date1.font = .boldSystemFont(ofSize: 20)
        date2.font = .boldSystemFont(ofSize: 13)
        greeting.font = .boldSystemFont(ofSize: 25)
        
        let China = Region(calendar: Calendars.gregorian, zone: Zones.asiaShanghai, locale: Locales.chineseChina)
        SwiftDate.defaultRegion = China
        let date = Date()
        date1.text = date.day.description
        date2.text = self.intIntoString(number: Int(date.month.description)!)+"月"
        poweron.text = " ⎸"
        greeting.text = self.timeOfDay(date: date) + "!"
        user.image = UIImage(systemName: "person")
        
        rootView.snp.makeConstraints { (make) in
            make.width.equalToSuperview()
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            make.left.equalToSuperview()
        }
        
        date1.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(30)
            make.left.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(30)
        }
        
        date2.snp.makeConstraints { (make) in
            make.width.equalTo(40)
            make.height.equalTo(25)
            make.left.lessThanOrEqualTo(date1)
            make.top.lessThanOrEqualTo(date1.snp.bottom).offset(-10)
        }
        
        poweron.snp.makeConstraints { make in
            make.left.equalTo(date1.snp.right)
            make.centerY.equalToSuperview().offset(13)
        }
        
        greeting.snp.makeConstraints { (make) in
            make.width.equalTo(100)
            make.height.equalToSuperview()
            make.left.equalTo(poweron.snp.right).offset(15)
            make.centerY.equalToSuperview().offset(13)
            
        }
        
        user.snp.makeConstraints { (make) in
            make.centerY.equalTo(greeting)
            make.right.equalTo(self.snp.left).offset(370)
        }
        
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func intIntoString(number: Int) -> String{
        var result:String!
        switch (number) {
        case 1: result = "一"
        case 2: result = "二"
        case 3: result = "三"
        case 4: result = "四"
        case 5: result = "五"
        case 6: result = "六"
        case 7: result = "七"
        case 8: result = "八"
        case 9: result = "九"
        case 10:result = "十"
        case 11:result = "十一"
        case 12:result = "十二"
        default:
            break
        }
        return result
    }
    
    func timeOfDay(date:Date) -> String{
        let hour = date.hour
//        debugPrint(date.day,hour,date.minute)
        if (hour >= 5 ) && ( hour < 10) {return "早上好"}
        else if (hour >= 10 ) && (hour < 14) {return "中午好"}
        else if (hour >= 14) && (hour < 17) {return "下午好"}
        else {return "晚上好"}
    }
}
