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
    var myURL:String!
    
    init(_ url:String) {
        myURL = url
        debugPrint(url)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        let screenRect = UIScreen.main.bounds.size
        let tableRect = CGRect(x: 0, y: 0, width: screenRect.width, height: screenRect.height-50)
        let controlRect = CGRect(x: 0, y: screenRect.height-50, width: screenRect.width, height: 50)
        
        let controlBar = UIView(frame: controlRect)
        controlBar.backgroundColor = .gray
        
        let webview = WKWebView(frame: tableRect)
        //创建网址
        let url = URL(string: myURL)
        //创建请求
        let request = NSURLRequest(url: url!)
        //加载请求
        webview.load(request as URLRequest)
        //添加wkwebview
        
        let back = UIButton()
        let poweron = UILabel()
        
        back.setImage(UIImage(systemName: "chevron.left"), for: .normal)
        poweron.text = " ⎸"
        controlBar.backgroundColor = .systemBackground
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(webview)
        self.view.addSubview(controlBar)
        controlBar.addSubview(back)
        controlBar.addSubview(poweron)
        
        //back.addAction(UIAction(, for: <#T##UIControl.Event#>)
        
        back.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(17)
            make.centerY.equalTo(controlBar.snp.centerY)
        }
        
        poweron.snp.makeConstraints { make in
            make.left.equalTo(back.snp.right).offset(15)
            make.centerY.equalTo(back.snp.centerY).offset(-2)
        }
        
        
    }
}

class Comment: UIView {
    

}
