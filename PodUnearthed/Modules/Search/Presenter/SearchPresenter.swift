//
//  SearchPresenter.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 09/10/23.
//

import UIKit

class SearchPresenter: SearchViewToPresenterProtocol {
    // MARK: - Properties
    weak var view: SearchPresenterToViewProtocol?
    var interactor: SearchPresenterToInteractorProtocol?
    var router: SearchPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView(term: String?) {
        interactor?.fetchPodcast(term: term)
    }
    
    func getPodcastCount() -> Int? {
        return interactor?.podcast?.count
    }
    
    func getPodcast(index: Int) -> PodcastListModel? {
        return interactor?.podcast?[index]
    }
}

// MARK: - SearchInteractorToPresenterProtocol
extension SearchPresenter: SearchInteractorToPresenterProtocol {
    func isLoading(isLoading: Bool) {
        view?.showLoading(isLoading: isLoading)
    }
    
    func podcastFetched() {
        view?.showPodcast()
    }
    
    func podcastFetchedFailed() {
        view?.showErrorPodcast()
    }
}
