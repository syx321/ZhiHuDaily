//
//  CustomizeRollView.swift
//  ZhiHuDaily
//
//  Created by 苏易肖 on 2021/4/27.
//

import Foundation
import SnapKit
import SwiftyJSON

class firstCell : UIView,UICollectionViewDelegate,UICollectionViewDataSource{
    lazy var collection = UICollectionView()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    convenience init (frame: CGRect,json:JSON){
        self.init(frame: frame)
        
        collection = UICollectionView(frame: frame)
        collection.dataSource = self
        collection.delegate = self
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

class CusCollectionCell: UICollectionViewCell {
  
  
}
