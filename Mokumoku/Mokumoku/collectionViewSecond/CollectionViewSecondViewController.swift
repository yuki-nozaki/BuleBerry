//
//  CollectionViewSecondViewController.swift
//  Mokumoku
//
//  Created by 野崎勇樹 on 2017/11/01.
//  Copyright © 2017年 野崎勇樹. All rights reserved.
//

import UIKit

class CollectionViewSecondViewController: UIViewController {

    var computedCellSize: CGSize?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.register(PropotionalSizingCell.nib, forCellWithReuseIdentifier: "Cell")
    }

}

extension CollectionViewSecondViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if let cellSize = self.computedCellSize {
            return cellSize
        } else {
            
            guard let prototypeCell = PropotionalSizingCell.nib.instantiate(withOwner: nil, options: nil).first as? PropotionalSizingCell,
                let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
                    fatalError()
            }
            
            let cellSize = prototypeCell.propotionalScaledSize(for: flowLayout, numberOfColumns: 2)
            self.computedCellSize = cellSize
            
            return cellSize
        }
    }
}

private extension PropotionalSizingCell {
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
}
