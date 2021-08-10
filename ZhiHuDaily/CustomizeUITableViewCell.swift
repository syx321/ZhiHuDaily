//
//  CustomeizeUITableViewCell.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/4/7.
//

import Foundation
import UIKit
import SnapKit

class CustomizeUITableViewCell : UITableViewCell {
    var viewContainer: UIView!
    var hint : UILabel!
    var title : UILabel!
    var picture : UIImage!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        viewContainer = UIView()
        
        title = UILabel()
//        title.font = .systemFont(ofSize: 17)
//        title.font = UIFont(name: "Arial Rounded MT Bold", size: 17)
        title.font = .boldSystemFont(ofSize: 17)
        title.numberOfLines = 0
        title.lineBreakMode = .byWordWrapping

        hint = UILabel()
        hint.font = .boldSystemFont(ofSize: 13)
        hint.textColor = .gray
        
        
        viewContainer.addSubview(title)
        viewContainer.addSubview(hint)
        self.addSubview(viewContainer)
        
        viewContainer.snp.makeConstraints { (make) in
            make.height.equalToSuperview()
            make.top.equalTo(self).offset(0)
            make.left.equalToSuperview().offset(7)
            make.right.equalToSuperview().offset(-90)
        }
        
        title.snp.makeConstraints { (make) in
            make.width.equalToSuperview().offset(-20)
            make.top.equalToSuperview().offset(18)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)

        }
        hint.snp.makeConstraints { (make) in
            // 让顶部距离view1的底部为10的距离
            make.top.equalTo(title.snp.bottom).offset(5)
            // 设置宽、高
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.left.lessThanOrEqualTo(title)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: -图片扩展下载方法
extension UIImageView {
    func downloadedFrom(imageurl : String){
            //创建URL对象
            let url = URL(string: imageurl)!
            //创建请求对象
            let request = URLRequest(url: url)

            let session = URLSession.shared
            let dataTask = session.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
                if error != nil{
                    print(error.debugDescription)
                }else{
                    //将图片数据赋予UIImage
                    let img = UIImage(data:data!)

                    // 这里需要改UI，需要回到主线程
                    DispatchQueue.main.async {
                      self.image = img
                    }
                }
            }) as URLSessionTask

            //使用resume方法启动任务
            dataTask.resume()
        }
}
