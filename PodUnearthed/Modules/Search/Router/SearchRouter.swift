//
//  SearchRouter.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 09/10/23.
//

import UIKit

class SearchRouter: SearchPresenterToRouterProtocol {
    static func createSearchModule() -> UIViewController {
        let view = SearchViewController()
        let presenter: SearchViewToPresenterProtocol & SearchInteractorToPresenterProtocol = SearchPresenter()
        let interactor: SearchPresenterToInteractorProtocol = SearchInteractor()
        let router: SearchPresenterToRouterProtocol = SearchRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
