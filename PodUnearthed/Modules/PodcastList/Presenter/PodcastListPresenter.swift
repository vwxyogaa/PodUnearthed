//
//  PodcastListPresenter.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 03/10/23.
//

import UIKit

class PodcastListPresenter: PodcastListViewToPresenterProtocol {
    // MARK: - Properties
    weak var view: PodcastListPresenterToViewProtocol?
    var interactor: PodcastListPresenterToInteractorProtocol?
    var router: PodcastListPresenterToRouterProtocol?
    
    // MARK: - Methods
    func updateView() {
        interactor?.fetchPodcastComedy()
        interactor?.fetchPodcastHorror()
        interactor?.fetchPodcastSport()
    }
    
    // MARK: - Comedy
    func getPodcastComedyCount() -> Int? {
        return interactor?.podcastComedy?.count
    }
    
    func getPodcastComedy(index: Int) -> PodcastListModel? {
        return interactor?.podcastComedy?[index]
    }
    
    // MARK: - Horror
    func getPodcastHorrorCount() -> Int? {
        return interactor?.podcastHorror?.count
    }
    
    func getPodcastHorror(index: Int) -> PodcastListModel? {
        return interactor?.podcastHorror?[index]
    }
    
    // MARK: - Sport
    func getPodcastSportCount() -> Int? {
        return interactor?.podcastSport?.count
    }
    
    func getPodcastSport(index: Int) -> PodcastListModel? {
        return interactor?.podcastSport?[index]
    }
}

// MARK: - PodcastListInteractorToPresenterProtocol
extension PodcastListPresenter: PodcastListInteractorToPresenterProtocol {
    func isLoading(isLoading: Bool) {
        view?.showLoading(isLoading: isLoading)
    }
    
    // MARK: - Comedy
    func podcastComedyFetched() {
        view?.showPodcastComedy()
    }
    
    func podcastComedyFetchedFailed() {
        view?.showErrorPodcastComedy()
    }
    
    // MARK: - Horror
    func podcastHorrorFetched() {
        view?.showPodcastHorror()
    }
    
    func podcastHorrorFetchedFailed() {
        view?.showErrorPodcastHorror()
    }
    
    // MARK: - Sport
    func podcastSportFetched() {
        view?.showPodcastSport()
    }
    
    func podcastSportFetchedFailed() {
        view?.showErrorPodcastSport()
    }
}
