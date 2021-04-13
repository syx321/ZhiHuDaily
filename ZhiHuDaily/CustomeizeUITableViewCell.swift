//
//  CustomeizeUITableViewCell.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/4/7.
//

import Foundation
import UIKit

class CustomizeUITableViewCell : UITableViewCell {
    var picture : UILabel!
    var title : UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        picture = UILabel(frame: CGRect(x: 15, y: 15, width: 250, height: 50))
        picture.font = .boldSystemFont(ofSize: 17)
        picture.numberOfLines = 2
        
        title = UILabel(frame: CGRect(x: 15, y: 15, width: 250, height: 50))
        title.font = .systemFont(ofSize: 15)
        title.textColor = .gray
        
        self.addSubview(picture)
        self.addSubview(title)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
