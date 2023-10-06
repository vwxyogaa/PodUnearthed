//
//  PodcastListProtocol.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 03/10/23.
//

import UIKit

protocol PodcastListPresenterToViewProtocol: AnyObject {
    func showPodcastComedy()
    func showErrorPodcastComedy()
    func showPodcastHorror()
    func showErrorPodcastHorror()
    func showPodcastSport()
    func showErrorPodcastSport()
}

protocol PodcastListInteractorToPresenterProtocol: AnyObject {
    func podcastComedyFetched()
    func podcastComedyFetchedFailed()
    func podcastHorrorFetched()
    func podcastHorrorFetchedFailed()
    func podcastSportFetched()
    func podcastSportFetchedFailed()
}

protocol PodcastListPresenterToInteractorProtocol: AnyObject {
    var presenter: PodcastListInteractorToPresenterProtocol? { get set }
    var podcastComedy: [PodcastListModel]? { get }
    var podcastHorror: [PodcastListModel]? { get }
    var podcastSport: [PodcastListModel]? { get }
    
    func fetchPodcastComedy()
    func fetchPodcastHorror()
    func fetchPodcastSport()
}

protocol PodcastListPresenterToRouterProtocol: AnyObject {
    static func createPodcastListModule() -> UIViewController
}

protocol PodcastListViewToPresenterProtocol: AnyObject {
    var view: PodcastListPresenterToViewProtocol? { get set }
    var interactor: PodcastListPresenterToInteractorProtocol? { get set }
    var router: PodcastListPresenterToRouterProtocol? { get set }
    
    func updateView()
    func getPodcastComedyCount() -> Int?
    func getPodcastComedy(index: Int) -> PodcastListModel?
    func getPodcastHorrorCount() -> Int?
    func getPodcastHorror(index: Int) -> PodcastListModel?
    func getPodcastSportCount() -> Int?
    func getPodcastSport(index: Int) -> PodcastListModel?
}
