//
//  PodcastDetailProtocol.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import UIKit
import FeedKit

protocol PodcastDetailPresenterToViewProtocol: AnyObject {
    func showPodcastDetail()
    func showErrorPodcastDetail()
}

protocol PodcastDetailInteractorToPresenterProtocol: AnyObject {
    func podcastDetailFetched()
    func podcastDetailFetchedFailed()
}

protocol PodcastDetailPresenterToInteractorProtocol: AnyObject {
    var presenter: PodcastDetailInteractorToPresenterProtocol? { get set }
    var podcastDetail: PodcastListModel? { get }
    var rssFeed: RSSFeed? { get }
    
    func fetchPodcastDetail()
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
