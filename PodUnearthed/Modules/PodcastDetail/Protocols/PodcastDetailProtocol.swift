//
//  PodcastDetailProtocol.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import UIKit
import FeedKit

protocol PodcastDetailPresenterToViewProtocol: AnyObject {
    func showLoading(isLoading: Bool)
    func showPodcastDetail()
    func showErrorPodcastDetail()
}

protocol PodcastDetailInteractorToPresenterProtocol: AnyObject {
    func isLoading(isLoading: Bool)
    func podcastDetailFetched()
    func podcastDetailFetchedFailed()
}

protocol PodcastDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: PodcastDetailInteractorToPresenterProtocol? { get set }
    var podcastDetail: PodcastListModel? { get }
    var rssFeed: RSSFeed? { get }
    var playlist: RSSFeed? { get }
    var currentIndex: Int? { get }
    var playbackLikelyToKeepUpContext: Int? { get }
    var podcastNowPlayingInfo: [String: Any] { get }
    var isAVAudioSessionActive: Bool { get }
    var state: PlayerViewState { get }
    
    func fetchPodcastDetail()
    func podcastPlay()
    func launchPodcastPlaylist(playlist: RSSFeed, index: Int)
}

protocol PodcastDetailPresenterToRouterProtocol: AnyObject {
    static func createPodcastDetailModule(with podcast: PodcastListModel) -> UIViewController
}

protocol PodcastDetailViewToPresenterProtocol: AnyObject {
    var view: PodcastDetailPresenterToViewProtocol? { get set }
    var interactor: PodcastDetailPresenterToInteractorProtocol? { get set }
    var router: PodcastDetailPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getRssFeed() -> RSSFeed?
    func getPodcastDetail() -> PodcastListModel?
}
