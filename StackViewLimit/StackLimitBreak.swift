//
//  StackLimitBreak.swift
//  StackViewLimit
//
//  Created by Arvind Subramanian on 4/5/16.
//  Copyright © 2016 WeddingWire. All rights reserved.
//

import Foundation
import SnapKit
import UIKit
import MapKit

class PepeView : UIView {
    lazy var container: UIView = {
        let container = UIView(frame: CGRectZero)
        
        self.addSubview(container)
        return container
    }()
    
    
    lazy var pepe: UIImageView = {
        let pepeImage = UIImage(named: "pepe")
        let view = UIImageView(image: pepeImage)
        
        self.container.addSubview(view)
        return view
    }()
    
    
    override func updateConstraints() {
        container.snp_updateConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        pepe.snp_updateConstraints { (make) in
            make.edges.equalTo(container)
        }
        
        super.updateConstraints()
    }
}

class TrumpView : UIView {
    lazy var container: UIView = {
        let container = UIView(frame: CGRectZero)
        
        self.addSubview(container)
        return container
    }()
    
    
    lazy var godEmperor: UIImageView = {
        let emperor = UIImage(named: "godemp")
        let view = UIImageView(image: emperor)
        
        self.container.addSubview(view)
        return view
    }()
    
    lazy var visageOfTheLord : UIImageView = {
        let trump = UIImage(named: "trump")
        let view = UIImageView(image: trump)
        view.layer.zPosition = 2
        
        self.container.addSubview(view)
        return view
    }()
    
    
    override func updateConstraints() {
        container.snp_updateConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        godEmperor.snp_updateConstraints { (make) in
            make.edges.equalTo(container)
        }
        
        visageOfTheLord.snp_updateConstraints { (make) in
            make.leading.equalTo(container)
            make.centerY.equalTo(container)
        }
        
        super.updateConstraints()
    }
}

class MapView : UIView {
    lazy var container: UIView = {
        let container = UIView()
        
        self.addSubview(container)
        return container
    }()
    
    lazy var mapView: MKMapView = {
        let map = MKMapView()
        
        self.container.addSubview(map)
        return map
    }()
    
    lazy var mapOverlay: UIView = {
        let overlay = UIView()
        overlay.backgroundColor = UIColor.blackColor().colorWithAlphaComponent(0.3)
        
        self.container.addSubview(overlay)
        return overlay
    }()
    
    override func intrinsicContentSize() -> CGSize {
        return CGSizeMake(UIScreen.mainScreen().bounds.width, 250)
    }
    
    
    override func updateConstraints() {
        container.snp_updateConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        mapView.snp_updateConstraints { (make) in
            make.edges.equalTo(container)
        }
        
        mapOverlay.snp_updateConstraints { (make) in
            make.top.leading.trailing.equalTo(container)
            make.height.equalTo(30)
        }
        
        super.updateConstraints()
    }
}


class TrinketCell : UICollectionViewCell {
    
    lazy var image : UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor.blueColor()
        self.contentView.addSubview(view)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .redColor()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        image.snp_updateConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        super.updateConstraints()
    }
}

let itemSquareSideLength = UIScreen.mainScreen().bounds.width/2 - 1


class TrinketView : UIView, UICollectionViewDataSource {
    lazy var container: UIView = {
        let container = UIView()
        
        self.addSubview(container)
        return container
    }()
    
    
    lazy var collectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.minimumInteritemSpacing = 1
        collectionViewLayout.minimumLineSpacing = 1
        
        
        collectionViewLayout.itemSize = CGSizeMake(itemSquareSideLength, itemSquareSideLength)
        collectionViewLayout.sectionInset = UIEdgeInsetsZero
        
        let collection = UICollectionView(frame: CGRectZero, collectionViewLayout: collectionViewLayout)
        collection.registerClass(TrinketCell.self, forCellWithReuseIdentifier: "Trinket")
        collection.dataSource = self
        
        self.container.addSubview(collection)
        return collection
    }()
    
    lazy var items = [UIImage(named: "trump"), UIImage(named: "godemp"), UIImage(named: "pepe"), UIImage(named: "reagan"), UIImage(named: "yogi")]
    
    override func updateConstraints() {
        container.snp_updateConstraints { (make) in
            make.edges.equalTo(self)
        }
        
        collectionView.snp_updateConstraints { (make) in
            make.edges.equalTo(container)
        }
        
        super.updateConstraints()
    }
    
//    override func layoutSubviews() {
//        collectionView.collectionViewLayout.invalidateLayout()
//        collectionView.reloadData()
//        
//        super.layoutSubviews()
//        
//    }
    
    override func intrinsicContentSize() -> CGSize {
//        print(collectionView.collectionViewLayout.collectionViewContentSize())
        let height = itemSquareSideLength * CGFloat(items.count) + CGFloat(items.count) + 10
        let width = UIScreen.mainScreen().bounds.size.width
        return CGSizeMake(width, height)
        
//        return collectionView.collectionViewLayout.collectionViewContentSize()
    }
    
    // MARK: UICollectionViewDataSource
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    // The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("Trinket", forIndexPath: indexPath) as! TrinketCell
//        print(cell)
//        print(items[indexPath.row])
        cell.image.image = items[indexPath.row]
//        cell.setNeedsUpdateConstraints()
        cell.updateConstraintsIfNeeded()
//        collectionView.reloadItemsAtIndexPaths([indexPath])
        return cell
    }
    
}

class StackLimitBreakViewController : UIViewController {
    lazy var stackViewContainer: UIScrollView = {
        let container = UIScrollView()
        container.backgroundColor = .cyanColor()
        
        self.view.addSubview(container)
        return container
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [PepeView(), PepeView(), TrumpView(), TrinketView(), TrinketView(), TrinketView(), TrinketView(), TrinketView(), TrumpView(), TrumpView(), TrinketView(), TrinketView(), TrinketView(), TrinketView(), TrinketView(), TrinketView(), TrinketView(), TrinketView(), TrinketView(),TrinketView(), TrinketView(), TrinketView(), MapView()])
        stack.axis = .Vertical
        
        self.stackViewContainer.addSubview(stack)
        
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func updateViewConstraints() {
        stackViewContainer.snp_updateConstraints { (make) -> Void in
            make.edges.equalTo(view)
        }
        
        stackView.snp_updateConstraints { (make) -> Void in
            make.edges.equalTo(stackViewContainer)
            make.width.equalTo(view)
        }
        
        super.updateViewConstraints()
    }
    
    
    
}