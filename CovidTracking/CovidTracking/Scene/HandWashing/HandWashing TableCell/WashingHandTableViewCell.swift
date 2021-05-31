//
//  WashingHandTableViewCell.swift
//  CovidTracking
//
//  Created by Quang Nguyen on 5/29/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable
import RxSwift
import RxCocoa

final class WashingHandTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.do {
            $0.register(cellType: WashingHandCollectionViewCell.self)
            $0.showsVerticalScrollIndicator = false
            $0.showsHorizontalScrollIndicator = false

            let layout = UICollectionViewFlowLayout().then {
                $0.scrollDirection = .horizontal
                $0.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
                $0.itemSize = CGSize(width: 370, height: 230)
                $0.minimumLineSpacing = 0
                $0.minimumInteritemSpacing = 0
            }
            
            $0.collectionViewLayout = layout
        }
    }
    
    func bindViewModel(model: WashingHand) {
        
        _ = Observable.of(model.steps)
            .asDriverOnErrorJustComplete()
            .drive(collectionView.rx.items) { ( collectionView, index, _ ) in
                let indexPath = IndexPath(item: index, section: 0)
                let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: WashingHandCollectionViewCell.self)
                cell.config(image: model.steps[index])
                return cell
            }
        
        titleLabel.text = model.title
    }
}
