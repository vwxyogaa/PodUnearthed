//
//  PlayerViewPresenter.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 30/10/23.
//

class PlayerViewPresenter: PlayerViewViewToPresenterProtocol {
    // MARK: - Properties
    var view: PlayerViewPresenterToViewProtocol?
    var interactor: PlayerViewPresenterToInteractorProtocol?
    var router: PlayerViewPresenterToRouterProtocol?
}

extension PlayerViewPresenter: PlayerViewInteractorToPresenterProtocol {
    func isLoading(isLoading: Bool) {
        view?.showLoading(isLoading: isLoading)
    }
}
