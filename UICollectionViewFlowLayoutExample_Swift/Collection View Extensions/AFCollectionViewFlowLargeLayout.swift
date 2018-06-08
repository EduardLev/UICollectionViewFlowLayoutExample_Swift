//
//  AFCollectionViewFlowLargeLayout.swift
//  UICollectionViewFlowLayoutExample_Swift
//
//  Based on the Objective-C project by Ash Furrow 2013-02-05
//  Created by Eduard Lev on 6/8/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

import UIKit

class AFCollectionViewFlowLargeLayout: UICollectionViewFlowLayout {

    override init() {
        super.init()

        self.itemSize = CGSize(width: 130, height: 130)
        self.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        self.minimumInteritemSpacing = 10.0
        self.minimumLineSpacing = 10.0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
