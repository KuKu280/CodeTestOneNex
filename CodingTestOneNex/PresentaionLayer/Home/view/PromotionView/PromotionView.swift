//
//  PromotionView.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit
import UIComponents

class PromotionView: NibBasedView {
    
    @IBOutlet private(set) var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.register(
            PromotionItemCell.self,
            forCellWithReuseIdentifier: "itemcell"
        )
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension PromotionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: collectionView.frame.width / 2 + 50,
            height: collectionView.frame.height
        )
    }
}

extension PromotionView: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 5
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "itemcell", for: indexPath
        ) as? PromotionItemCell else {
            return UICollectionViewCell()
        }
      
        return cell
    }
    
    
}
