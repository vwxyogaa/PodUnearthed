//
//  PodcastDetailPresenter.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import FeedKit

class PodcastDetailPresenter: PodcastDetailViewToPresenterProtocol {
    // MARK: - Properties
    weak var view: PodcastDetailPresenterToViewProtocol?
    var interactor: PodcastDetailPresenterToInteractorProtocol?
    var router: PodcastDetailPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchPodcastDetail()
    }
    
    func getRssFeed() -> RSSFeed? {
        return interactor?.rssFeed
    }
    
    func getPodcastDetail() -> PodcastListModel? {
        return interactor?.podcastDetail
    }
}

// MARK: - PodcastDetailInteractorToPresenterProtocol
extension PodcastDetailPresenter: PodcastDetailInteractorToPresenterProtocol {
    func podcastDetailFetched() {
        view?.showPodcastDetail()
    }
    
    func podcastDetailFetchedFailed() {
        view?.showErrorPodcastDetail()
    }
}
