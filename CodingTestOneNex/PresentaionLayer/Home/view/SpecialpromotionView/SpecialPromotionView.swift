//
//  SpecialPromotionView.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/2/23.
//

import UIKit

class SpecialPromotionView: NibBasedControl {
    
    @IBOutlet private(set) var collectionView: UICollectionView!
    @IBOutlet private(set) var pageControl: UIPageControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        setupCollectionView()
        setupPageControl()
    }
    
    private func setupCollectionView() {
        collectionView.register(
            SpecialpromotionItemCell.self,
            forCellWithReuseIdentifier: "itemcell"
        )
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = 5
    }

}

extension SpecialPromotionView: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(
            width: collectionView.frame.width,
            height: collectionView.frame.height
        )
    }
    
    func scrollViewDidEndScrollingAnimation(
        _ scrollView: UIScrollView
    ) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidEndDecelerating(
        _ scrollView: UIScrollView
    ) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

extension SpecialPromotionView: UICollectionViewDataSource {
    
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
        ) as? SpecialpromotionItemCell else {
            return UICollectionViewCell()
        }
      
        return cell
    }
    
    
}
