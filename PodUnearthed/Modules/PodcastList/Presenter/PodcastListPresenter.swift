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
}

// MARK: - PodcastListInteractorToPresenterProtocol
extension PodcastListPresenter: PodcastListInteractorToPresenterProtocol {
}
