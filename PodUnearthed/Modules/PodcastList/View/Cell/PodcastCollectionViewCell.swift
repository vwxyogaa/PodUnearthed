//
//  PodcastCollectionViewCell.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 05/10/23.
//

import UIKit

class PodcastCollectionViewCell: UICollectionViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    
    // MARK: - Lifecycles
    override func awakeFromNib() {
        super.awakeFromNib()
        configureViews()
    }
    
    // MARK: - Methods
    private func configureViews() {
        containerView.layer.cornerRadius = 12
        containerView.layer.masksToBounds = true
        
        artworkImageView.layer.cornerRadius = 12
        artworkImageView.layer.masksToBounds = true
    }
    
    func configureContent(artworkImage: String?, trackName: String?, artistName: String?) {
        if let imageUrl = artworkImage, !imageUrl.isEmpty {
            self.artworkImageView.loadImage(uri: imageUrl)
        } else {
            self.artworkImageView.backgroundColor = .darkGray
        }
        trackNameLabel.text = trackName
        artistNameLabel.text = artistName
    }
}
