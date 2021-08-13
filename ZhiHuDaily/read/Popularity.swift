//
//  popularity.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/8/13.
//

import Foundation
import UIKit

class Popularity: UIView {
    var rootView = UIView()
    var support: UIButton!
    var popularity: UILabel!
    var url: String!
    
    init(frame: CGRect, url:String) {
        super.init(frame: frame)
        self.url = "https://news-at.zhihu.com/api/3/story-extra/"+url
        
        support = UIButton()
        support.setImage(UIImage(systemName: "hand.thumbsup"), for: .normal)
        support.tintColor = .black
        popularity = UILabel()
        popularity.text = "0"
        popularity.font =  .boldSystemFont(ofSize: 10)
        self.getPopularity()
        popularity.tintColor = .black
        
        self.addSubview(rootView)
        rootView.addSubview(support)
        rootView.addSubview(popularity)
        
        rootView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            make.right.equalToSuperview()
        }
        
        support.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        popularity.snp.makeConstraints { make in
            make.left.equalTo(support.snp.right).offset(2)
            make.top.equalTo(support).offset(2)
        }
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getPopularity() {
        let download = Download()
        
        download.getContent(url) { JSON in
            self.popularity.text = JSON["popularity"].stringValue
        }
    }
}
