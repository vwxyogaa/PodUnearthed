//
//  EpisodeTableViewCell.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import UIKit
import FeedKit

protocol EpisodeTableViewCellDelegate {
    func playButtonTapped(_ cell: EpisodeTableViewCell)
}

class EpisodeTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var episodeImageView: UIImageView!
    @IBOutlet weak var pubDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var durationLabel: UILabel!
    
    // MARK: - Properties
    var delegate: EpisodeTableViewCellDelegate?
    
    // MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        initViews()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Methods
    private func initViews() {
        episodeImageView.layer.cornerRadius = 12
        episodeImageView.layer.masksToBounds = true
        
        playButton.layer.cornerRadius = playButton.frame.height / 2
        playButton.layer.masksToBounds = true
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    }
    
    func configureContent(imageUrl: String?, pubDate: String?, title: String?, description: String?, duration: String?) {
        if let imageUrl = imageUrl, !imageUrl.isEmpty {
            self.episodeImageView.loadImage(uri: imageUrl)
        } else {
            self.episodeImageView.backgroundColor = .darkGray
        }
        let date = pubDate?.convertDateString(fromFormat: .serverDateWithTimeAndTandZ, toFormat: .dayMonthYear)
        pubDateLabel.text = date ?? "-"
        titleLabel.text = title ?? "-"
        descriptionLabel.attributedText = description?
            .convertHtmlToAttributedStringWithCSS(
                font: UIFont.systemFont(ofSize: 12, weight: .regular),
                cssColor: "#EEEEEE",
                lineHeight: 16,
                cssTextAlign: "left"
            )
        durationLabel.text = duration ?? "-"
    }
    
    // MARK: - Actions
    @objc
    private func playButtonTapped() {
        delegate?.playButtonTapped(self)
    }
}
