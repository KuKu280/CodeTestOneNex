//
//  NewsletterView.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit

class NewsletterView: NibBasedView {
    
    @IBOutlet private(set) var collectionView: UICollectionView!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
    }

    private func setupCollectionView() {
        collectionView.register(
            NewsletterItemCell.self,
            forCellWithReuseIdentifier: "itemcell"
        )
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
}

extension NewsletterView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: collectionView.frame.width / 3,
            height: collectionView.frame.height
        )
    }
}

extension NewsletterView: UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 3
    }
    
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "itemcell", for: indexPath
        ) as? NewsletterItemCell else {
            return UICollectionViewCell()
        }
      
        return cell
    }
    
    
}
