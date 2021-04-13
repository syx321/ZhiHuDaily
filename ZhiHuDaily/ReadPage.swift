//
//  ReadPage.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/3/29.
//

import Foundation
import UIKit

class ReadPage: UIViewController {
    
    weak var controller : UIViewController?
    var labelTxt = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lab = UILabel(frame: CGRect(x: 90, y: 100, width: 240, height: 44))
        lab.text = labelTxt
        
        let b = UIButton(frame: CGRect(x: 80, y: 180, width: 240, height: 44))
        b.setTitle("返回", for: .normal)
        b.backgroundColor = .black
        b.addTarget(self, action: #selector(self.dismissSelf), for: .touchUpInside)
        
        let b2 = UIButton(frame: CGRect(x: 80, y: 250, width: 240, height: 44))
        b2.setTitle("评论", for: .normal)
        b2.backgroundColor = .black
        b2.addTarget(self, action: #selector(self.openViewController), for: .touchUpInside)
        
        
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(lab)
        self.view.addSubview(b)
        self.view.addSubview(b2)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func openViewController() {
        let controller = Comment()
//        controller.labelTxt = "传递的参数！"
//        controller.controller = self
        print("评论")
        self.present(controller, animated: true, completion: nil)
        
    }
    
    @objc func dismissSelf(){
        print("关闭词条")
    
//        controller?.label.text = "返回的参数"
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

class Comment: UIViewController {
    weak var controller : UIViewController?
    var labelTxt = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let lab = UILabel(frame: CGRect(x: 90, y: 100, width: 240, height: 44))
        lab.text = labelTxt
        
        let b = UIButton(frame: CGRect(x: 80, y: 180, width: 240, height: 44))
        b.setTitle("返回", for: .normal)
        b.backgroundColor = .black
        b.addTarget(self, action: #selector(self.dismissSelf), for: .touchUpInside)
        
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(lab)
        self.view.addSubview(b)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func dismissSelf(){
        print("关闭评论")
    
//        controller?.label.text = "返回的参数"
        self.dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
