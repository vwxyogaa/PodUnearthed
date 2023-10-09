//
//  SearchProtocol.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 09/10/23.
//

import UIKit

protocol SearchPresenterToViewProtocol: AnyObject {
    func showLoading(isLoading: Bool)
    func showPodcast()
    func showErrorPodcast()
}

protocol SearchInteractorToPresenterProtocol: AnyObject {
    func isLoading(isLoading: Bool)
    func podcastFetched()
    func podcastFetchedFailed()
}

protocol SearchPresenterToInteractorProtocol: AnyObject {
    var presenter: SearchInteractorToPresenterProtocol? { get set }
    var podcast: [PodcastListModel]? { get }
    
    func fetchPodcast(term: String?)
}

protocol SearchPresenterToRouterProtocol: AnyObject {
    static func createSearchModule() -> UIViewController
}

protocol SearchViewToPresenterProtocol: AnyObject {
    var view: SearchPresenterToViewProtocol? { get set }
    var interactor: SearchPresenterToInteractorProtocol? { get set }
    var router: SearchPresenterToRouterProtocol? { get set }
    
    func updateView(term: String?)
    func getPodcastCount() -> Int?
    func getPodcast(index: Int) -> PodcastListModel?
}
