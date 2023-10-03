//
//  PodcastListRouter.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 03/10/23.
//

import UIKit

class PodcastListRouter: PodcastListPresenterToRouterProtocol {
    static func createPodcastListModule() -> UIViewController {
        let view = PodcastListViewController()
        let presenter: PodcastListViewToPresenterProtocol & PodcastListInteractorToPresenterProtocol = PodcastListPresenter()
        let interactor: PodcastListPresenterToInteractorProtocol = PodcastListInteractor()
        let router: PodcastListPresenterToRouterProtocol = PodcastListRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
