//
//  LoopCollectionView.swift
//  LoopCollectionView
//
//  Created by David Ozmanian on 21.08.2021.
//

import UIKit

class LoopCollectionView: UICollectionView, UICollectionViewDelegate {

    var onDidEndDisplaying: ((IndexPath) -> Void)?
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        delegate = self
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard self.numberOfSections == 1 else {
            debugPrint("InfiniteCollectionView can contain only 1 section")
            return
        }
        guard (self.collectionViewLayout as? UICollectionViewFlowLayout)?.scrollDirection == .horizontal else {
            debugPrint("scrollDirection can be horizontal")
            return
        }
        let numberOfItems = CGFloat(self.numberOfItems(inSection: 0))
        let x = scrollView.contentOffset.x
        let width = scrollView.frame.size.width
        if x > 0 {
            if x >= width * (numberOfItems - 1) {
                contentOffset = CGPoint(x: scrollView.frame.size.width , y: 0)
            }
        } else if x < 0 {
            contentOffset = CGPoint(x: scrollView.frame.size.width * (numberOfItems - 2), y: 0)
        }
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.visibleCells.count == 1,
           let first = self.visibleCells.first,
           let indexpath = indexPath(for: first) {
            onDidEndDisplaying?(indexpath)
        }
    }
}

