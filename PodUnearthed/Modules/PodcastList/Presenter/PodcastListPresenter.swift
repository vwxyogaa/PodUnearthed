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
        return interactor?.podcastComedy?.trackId?.count
    }
    
    func getPodcastComedy() -> PodcastListModel? {
        return interactor?.podcastComedy
    }
    
    // MARK: - Horror
    func getPodcastHorrorCount() -> Int? {
        return interactor?.podcastHorror?.trackId?.count
    }
    
    func getPodcastHorror() -> PodcastListModel? {
        return interactor?.podcastHorror
    }
    
    // MARK: - Sport
    func getPodcastSportCount() -> Int? {
        return interactor?.podcastSport?.trackId?.count
    }
    
    func getPodcastSport() -> PodcastListModel? {
        return interactor?.podcastSport
    }
}

// MARK: - PodcastListInteractorToPresenterProtocol
extension PodcastListPresenter: PodcastListInteractorToPresenterProtocol {
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
