//
//  PlayerViewRouter.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 30/10/23.
//

import UIKit
import FeedKit
import AVFoundation

class PlayerViewRouter: PlayerViewPresenterToRouterProtocol {
    static func createPlayerViewModule(with playlist: RSSFeed, currentIndex: Int? = nil, podcastPlayer: AVPlayer? = nil, playbackLikelyToKeepUpContext: Int, podcastNowPlayingInfo: [String : Any], isAVAudioSessionActive: Bool, state: PlayerViewState) -> UIView {
        let view = PlayerView()
        let presenter: PlayerViewViewToPresenterProtocol & PlayerViewInteractorToPresenterProtocol = PlayerViewPresenter()
        let interactor: PlayerViewPresenterToInteractorProtocol = PlayerViewInteractor(playlist: playlist, currentIndex: currentIndex, podcastPlayer: podcastPlayer, playbackLikelyToKeepUpContext: playbackLikelyToKeepUpContext, podcastNowPlayingInfo: podcastNowPlayingInfo, isAVAudioSessionActive: isAVAudioSessionActive, state: state)
        let router: PlayerViewPresenterToRouterProtocol = PlayerViewRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
