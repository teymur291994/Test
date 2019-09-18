//
//  ComicsTableViewCell.swift
//  Test
//
//  Created by Timur on 9/18/19.
//

import Kingfisher

class ComicsTableViewCell: UITableViewCell {
    // MARK: - properties

    @IBOutlet private weak var comicsImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - public

    func configure(comics: Comics) {
        titleLabel.text = comics.title
        comicsImageView.kf.setImage(with: comics.thumbnail.url,
                             options: [.transition(.fade(0.3))])
    }
}
