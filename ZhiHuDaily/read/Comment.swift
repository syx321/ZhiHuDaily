//
//  Comment.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/8/13.
//

import Foundation
import UIKit

class Comment:UIView {
    var rootView = UIView()
    var comments: UIButton!
    var commentNum: UILabel!
    var url: String!, num: Int = 0
    
    init(frame: CGRect,url: String) {
        super.init(frame: frame)
        self.url = "https://news-at.zhihu.com/api/3/story-extra/"+url
        
        comments = UIButton()
        commentNum = UILabel()
        
        comments.setImage(UIImage(systemName: "bubble.right"), for: .normal)
        comments.tintColor = .black
        self.getNum()
        commentNum.font = .boldSystemFont(ofSize: 10)
        
        self.addSubview(rootView)
        rootView.addSubview(comments)
        rootView.addSubview(commentNum)
        
        rootView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.width.equalToSuperview()
            make.height.equalToSuperview()
        }
        
        comments.snp.makeConstraints { make in
            make.left.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        commentNum.snp.makeConstraints { make in
            make.left.equalTo(comments.snp.right).offset(2)
            make.top.equalTo(comments.snp.top).offset(2)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getNum(){
        let download = Download()
        download.getContent(url) { JSON in
            self.num = Int(JSON["comments"].stringValue) ?? 0
            self.commentNum.text = String(self.num)
        }
    }
    
    
    
    
}
