//
//  PodcastListProtocol.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 03/10/23.
//

import UIKit

protocol PodcastListPresenterToViewProtocol: AnyObject {
}

protocol PodcastListInteractorToPresenterProtocol: AnyObject {
}

protocol PodcastListPresenterToInteractorProtocol: AnyObject {
    var presenter: PodcastListInteractorToPresenterProtocol? { get set }
}

protocol PodcastListPresenterToRouterProtocol: AnyObject {
    static func createPodcastListModule() -> UIViewController
}

protocol PodcastListViewToPresenterProtocol: AnyObject {
    var view: PodcastListPresenterToViewProtocol? { get set }
    var interactor: PodcastListPresenterToInteractorProtocol? { get set }
    var router: PodcastListPresenterToRouterProtocol? { get set }
}
