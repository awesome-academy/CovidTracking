//
//  NewsTableViewCell.swift
//  CovidTracking
//
//  Created by Tiến on 5/25/21.
//  Copyright © 2021 Tiến. All rights reserved.
//

import UIKit
import Reusable
import RxCocoa
import RxSwift
import SDWebImage

final class NewsTableViewCell: UITableViewCell, NibReusable {
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var thumbImage: UIImageView!
    @IBOutlet private weak var saveButton: UIButton!
    
    var didTapSaveButton: ((Int, Bool) -> Void)?
    var indexPath: Int?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        bindSaveAction()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setContent(article: Articles, index: Int) {
        self.indexPath = index
        titleLabel.text = article.title
        timeLabel.text = article.publishedDateTime
        descriptionLabel.text = article.description
        guard let url = URL(string: article.imageUrl) else {
            return
        }
        thumbImage.sd_setImage(with: url,
                               completed: nil)
        saveButton.isSelected = article.isSaved
    }
    
    func bindSaveAction() {
        saveButton.rx.tap.asDriver()
            .drive(onNext: { [weak self] _ in
                self?.saveButton.isSelected = !(self?.saveButton.isSelected ?? false)
                self?.didTapSaveButton?(self?.indexPath ?? 0, !(self?.saveButton.isSelected ?? false))
            })
            .disposed(by: rx.disposeBag)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
