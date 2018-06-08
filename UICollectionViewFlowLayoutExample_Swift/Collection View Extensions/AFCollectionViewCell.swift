//
//  AFCollectionViewCell.swift
//  UICollectionViewFlowLayoutExample_Swift
//
//  Based on the Objective-C project by Ash Furrow 2013-02-05
//  Created by Eduard Lev on 6/8/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

import UIKit

class AFCollectionViewCell: UICollectionViewCell {

    var imageView = UIImageView()

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height).insetBy(dx: 5, dy: 5))
        self.imageView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.addSubview(imageView)
        self.backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        // Apple Documentation:

        // The default implementation of this method does nothing. However, when overriding this method, it is recommended that you call super anyway (to ensure subclasses get parent behavior)

        // When a view is dequeued for use, this method is called before the corresponding dequeue method returns the view to your code. Subclasses can override this method and use it to reset properties to their default values and generally make the view ready to use again. You should not use this method to assign any new data to the view. That is the responsibility of your data source object.
        super.prepareForReuse()
        self.imageView.image = nil
    }



    
}
