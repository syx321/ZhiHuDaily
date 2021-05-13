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
    lazy var detailView = WKWebView()
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
        
        let screenRect = UIScreen.main.bounds.size
        let tableRect = CGRect(x: 0, y: 10, width: screenRect.width, height: screenRect.height-10)
        
        let webview = WKWebView(frame: tableRect)
        //创建网址
        let url = URL(string: myURL)
        //创建请求
        let request = NSURLRequest(url: url!)
        //加载请求
        webview.load(request as URLRequest)
        //添加wkwebview
        self.view.addSubview(webview)
    }
    

}

//class Comment: UIViewController {
//    weak var controller : UIViewController?
//    var labelTxt = ""
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        let lab = UILabel(frame: CGRect(x: 90, y: 100, width: 240, height: 44))
//        lab.text = labelTxt
//
//        let b = UIButton(frame: CGRect(x: 80, y: 180, width: 240, height: 44))
//        b.setTitle("返回", for: .normal)
//        b.backgroundColor = .black
//        b.addTarget(self, action: #selector(self.dismissSelf), for: .touchUpInside)
//
//        self.view.backgroundColor = .systemBackground
//        self.view.addSubview(lab)
//        self.view.addSubview(b)
//
//        // Do any additional setup after loading the view.
//    }
//
//    @objc func dismissSelf(){
//        print("关闭评论")
//
////        controller?.label.text = "返回的参数"
//        self.dismiss(animated: true, completion: nil)
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//
//}
