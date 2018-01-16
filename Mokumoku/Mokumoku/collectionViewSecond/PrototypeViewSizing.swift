//
//  PrototyoeViewSizing.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/01.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

protocol PrototypeViewSizing: class{}

extension PrototypeViewSizing where Self: UICollectionViewCell {
    
    func propotionalScaledSize(for flowLayout: UICollectionViewFlowLayout, numberOfColumns nColums: Int) -> CGSize{
        let width = flowLayout.preferredItemWidth(forNumberOfColumns: nColums)
        self.bounds.size = CGSize(width: width, height: 0)
        self.layoutIfNeeded()
        
        return self.systemLayoutSizeFitting(UILayoutFittingExpandedSize, withHorizontalFittingPriority: UILayoutPriority.required, verticalFittingPriority: UILayoutPriority.defaultLow)
    }
    
}

private extension UICollectionViewFlowLayout {
    
    func preferredItemWidth(forNumberOfColumns nColumns: Int) -> CGFloat {
        guard nColumns > 0 else {
            return 0
        }
        guard let collectionView = self.collectionView else {
            fatalError()
        }
        
        let collectionViewWidth = collectionView.bounds.width
        let inset = self.sectionInset
        let spacing = self.minimumInteritemSpacing
        
        return (collectionViewWidth - (inset.left + inset.right + spacing * CGFloat(nColumns - 1))) / CGFloat(nColumns)
    }
}
