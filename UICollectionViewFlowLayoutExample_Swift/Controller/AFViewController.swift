//
//  AFViewController.swift
//  UICollectionViewFlowLayoutExample_Swift
//
//  Based on the Objective-C project by Ash Furrow 2013-02-05
//  Created by Eduard Lev on 6/8/18.
//  Copyright © 2018 Eduard Levshteyn. All rights reserved.
//

import UIKit

private let ItemIdentifier = "ItemIdentifier"

class AFViewController: UICollectionViewController {

    let smallLayout = AFCollectionViewFlowSmallLayout()
    let largeLayout = AFCollectionViewFlowLargeLayout()

    override func loadView() {
        // Important to oerride this when not using a nib. Otherwise, the collection view will be instantiated with a nil layout, crashing the app.
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: smallLayout)
        collectionView?.register(AFCollectionViewCell.self, forCellWithReuseIdentifier: ItemIdentifier)
        collectionView?.delegate = self
        collectionView?.dataSource = self

        collectionView?.indicatorStyle = .white
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        let segmentedControl = UISegmentedControl(items: ["Small", "Large"])
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentedControlValueDidChange), for: .valueChanged)
        self.navigationItem.titleView = segmentedControl
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - User Interface Methods

    @objc
    fileprivate func segmentedControlValueDidChange() {
        if collectionView?.collectionViewLayout == self.smallLayout {
                self.largeLayout.invalidateLayout()
            self.collectionView?.setCollectionViewLayout(self.largeLayout, animated: true)
        } else {
                self.smallLayout.invalidateLayout()
            self.collectionView?.setCollectionViewLayout(self.smallLayout, animated: true)
        }
    }

    // MARK: UICollectionViewDataSource & UICollectionViewDelegate

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ItemIdentifier, for: indexPath) as! AFCollectionViewCell
        cell.imageView.image = UIImage(named: "\(indexPath.item % 4).jpg")
        return cell
    }

}
