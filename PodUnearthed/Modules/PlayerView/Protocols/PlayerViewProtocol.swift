//
//  PlayerViewProtocol.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 30/10/23.
//

import UIKit
import FeedKit
import AVFoundation

protocol PlayerViewPresenterToViewProtocol: AnyObject {
    func showLoading(isLoading: Bool)
}

protocol PlayerViewInteractorToPresenterProtocol: AnyObject {
    func isLoading(isLoading: Bool)
}

protocol PlayerViewPresenterToInteractorProtocol: AnyObject {
    var presenter: PlayerViewInteractorToPresenterProtocol? { get set }
    var playlist: RSSFeed? { get }
    var currentIndex: Int? { get }
    var podcastPlayer: AVPlayer? { get }
    
    func isPodcastPlaying() -> Bool
}

protocol PlayerViewPresenterToRouterProtocol: AnyObject {
    static func createPlayerViewModule(with playlist: RSSFeed, currentIndex: Int?, podcastPlayer: AVPlayer?, playbackLikelyToKeepUpContext: Int, podcastNowPlayingInfo: [String : Any], isAVAudioSessionActive: Bool, state: PlayerViewState) -> UIView
}

protocol PlayerViewViewToPresenterProtocol: AnyObject {
    var view: PlayerViewPresenterToViewProtocol? { get set }
    var interactor: PlayerViewPresenterToInteractorProtocol? { get set }
    var router: PlayerViewPresenterToRouterProtocol? { get set }
}
