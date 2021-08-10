//
//  download.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/4/18.
//

import Foundation
import Alamofire
import CoreData
import SwiftyJSON

class Download{
    
    func getContent(_ url:String,closure:@escaping (JSON)->Void){
        let urlString = url
        let url:URL! = URL(string: urlString)

        AF.request(url,method: .get).responseJSON{ response in
            let value = response.value
            let json = JSON(value as Any)
   
            closure(json)
        }
    }
}
