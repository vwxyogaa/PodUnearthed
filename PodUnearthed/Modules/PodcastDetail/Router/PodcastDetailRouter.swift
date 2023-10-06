//
//  PodcastDetailRouter.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import UIKit

class PodcastDetailRouter: PodcastDetailPresenterToRouterProtocol {
    static func createPodcastDetailModule(with podcast: PodcastListModel) -> UIViewController {
        let view = PodcastDetailViewController()
        let presenter: PodcastDetailViewToPresenterProtocol & PodcastDetailInteractorToPresenterProtocol = PodcastDetailPresenter()
        let interactor: PodcastDetailPresenterToInteractorProtocol = PodcastDetailInteractor(podcast: podcast)
        let router: PodcastDetailPresenterToRouterProtocol = PodcastDetailRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
