//
//  NewsletterView.swift
//  CodingTestOneNex
//
//  Created by Ku Ku Zan on 11/3/23.
//

import UIKit

class NewsletterView: NibBasedView {
    
    @IBOutlet private(set) var collectionView: UICollectionView!
    
    var newsletters = [NewsLetter]() {
        didSet {
            collectionView.reloadData()
        }
    }

    struct NewsLetter {
        let name: String
        let date: String
    }
    
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
        return newsletters.count
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
        let newsletter = newsletters[indexPath.row]
        cell.render(title: newsletter.name)
        cell.render(date: newsletter.date)
        return cell
    }
    
    
}
