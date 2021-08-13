//
//  ReadPage.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/3/29.
//

import Foundation
import UIKit
import WebKit

class ReadPage: UIViewController, WKUIDelegate, WKNavigationDelegate {
    let myURL:String!
    var webview: WKWebView!
    var controlBar: UIView!
    
    init(_ url:String) {
        myURL = url
        debugPrint("阅读：",url)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        let screenRect = UIScreen.main.bounds.size
        let tableRect = CGRect(x: 0, y: 0, width: screenRect.width, height: screenRect.height-50)
        let controlRect = CGRect(x: 0, y: screenRect.height-50, width: screenRect.width, height: 50)
        
        self.controlBar = UIView(frame: controlRect)
        self.webview = WKWebView(frame: tableRect)
        
        
        //创建网址
        let url = URL(string: "https://daily.zhihu.com/story/"+myURL)
        //创建请求
        let request = NSURLRequest(url: url!)
        //加载请求
        webview.load(request as URLRequest)
        //添加wkwebview
        webview.navigationDelegate = self
        
        let back = UIButton()
        let poweron = UILabel()
        let comments = Comment(frame: CGRect(x: 0, y: 0, width: 15, height: 10), url: self.myURL)
        let support = Popularity(frame: CGRect(x: 0, y: 0, width: 15, height: 10), url: self.myURL)
        let star = UIButton()
        let share = UIButton()
        
        back.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        back.tintColor = .black
        poweron.text = " ⎸"
        poweron.tintColor = .black
        star.setImage(UIImage(systemName: "star"), for: .normal)
        star.tintColor = .black
        share.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        share.tintColor = .black
        controlBar.backgroundColor = UIColor(displayP3Red: 244, green: 244, blue: 244, alpha: 0.92)

        
        back.addTarget(self, action: #selector(self.getBack), for: .touchUpInside)
        
        self.view.addSubview(webview)
        self.view.addSubview(controlBar)
        controlBar.addSubview(back)
        controlBar.addSubview(poweron)
        controlBar.addSubview(comments)
        controlBar.addSubview(support)
        controlBar.addSubview(star)
        controlBar.addSubview(share)
        
        back.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalTo(controlBar.snp.centerY)
        }
        
        poweron.snp.makeConstraints { make in
            make.left.equalTo(back.snp.right).offset(15)
            make.centerY.equalTo(back.snp.centerY).offset(-2)
        }
        
        comments.snp.makeConstraints { make in
            make.centerY.equalTo(back)
            make.left.equalTo(poweron.snp.right).offset(30)
        }
        
        support.snp.makeConstraints { make in
            make.centerY.equalTo((back.snp.centerY))
            make.left.equalTo(comments.snp.right).offset(80)
        }
        star.snp.makeConstraints{ make in
            make.centerY.equalTo((support.snp.centerY))
            make.left.equalTo(support.snp.right).offset(75)
        }
        share.snp.makeConstraints{ make in
            make.centerY.equalTo((star.snp.centerY))
            make.left.equalTo(star.snp.right).offset(75)
        }
        

    }
    
    @objc func getBack() {
        self.navigationController?.popToRootViewController(animated: true)
    }
}
