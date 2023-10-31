//
//  PlayerView.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 30/10/23.
//

import UIKit
import MediaPlayer

class PlayerView: UIView {
    // MARK: - IBOutlets
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var playerProgressView: UIProgressView!
    
    // MARK: - Properties
    var presenter: PlayerViewViewToPresenterProtocol?
    
    // MARK: - Lifecycles
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        initViews()
        NotificationCenter.default.addObserver(self, selector: #selector(playerProviderStateDidChange), name: .PlayerProviderStateDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerProviderNowPlayingInfoDidChange), name: .PlayerProviderNowPlayingInfoDidChange, object: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        initViews()
        NotificationCenter.default.addObserver(self, selector: #selector(playerProviderStateDidChange), name: .PlayerProviderStateDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(playerProviderNowPlayingInfoDidChange), name: .PlayerProviderNowPlayingInfoDidChange, object: nil)
    }
    
    // MARK: - Methods
    private func commonInit() {
        let xibFileName = "PlayerView"
        let view = Bundle.main.loadNibNamed(xibFileName, owner: self, options: nil)![0] as! UIView
        self.addSubview(view)
        view.frame = self.bounds
    }
    
    private func initViews() {
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        
        playerImageView.layer.cornerRadius = 10
        playerImageView.layer.masksToBounds = true
    }
    
    func showPlayerView() {
        self.isHidden = false
        
        let playerProvider = presenter?.interactor
        let interval = CMTime(seconds: 0.5, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        playerProvider?.podcastPlayer?.addPeriodicTimeObserver(forInterval: interval, queue: DispatchQueue.main) { [weak self] (time) in
            guard let currentItem = playerProvider?.podcastPlayer?.currentItem else { return }
            let currentSeconds = CMTimeGetSeconds(time)
            let totalSeconds = CMTimeGetSeconds(currentItem.duration)
            let progress: CGFloat = max(0.0001, CGFloat(currentSeconds / totalSeconds))
            
            self?.playerProgressView.progress = Float(progress)
            self?.setNeedsLayout()
        }
    }
    
    func hidePlayerView() {
        self.isHidden = true
    }
    
    // MARK: - Actions
    @objc
    private func playerProviderStateDidChange() {
        showPlayerView()
        playerProviderNowPlayingInfoDidChange()
    }
    
    @objc
    private func playerProviderNowPlayingInfoDidChange() {
        if let episode = presenter?.interactor?.playlist?.items?[presenter?.interactor?.currentIndex ?? 0] {
            if let imageUrl = episode.pictureUrl, !imageUrl.isEmpty {
                self.playerImageView.loadImage(uri: imageUrl)
            } else {
                self.playerImageView.backgroundColor = .darkGray
            }
            titleLabel.text = episode.title
            playButton.setImage(
                UIImage(systemName: presenter?.interactor?.isPodcastPlaying() ?? false ? "play" : "pause"),
                for: .normal
            )
        }
    }
}

// MARK: - PlayerViewPresenterToViewProtocol
extension PlayerView: PlayerViewPresenterToViewProtocol {
    func showLoading(isLoading: Bool) {
        switch isLoading {
        case false:
            self.manageLoadingActivity(isLoading: false)
        case true:
            self.manageLoadingActivity(isLoading: true)
        }
    }
}
