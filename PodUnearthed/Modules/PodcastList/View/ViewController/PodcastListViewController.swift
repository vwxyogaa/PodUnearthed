//
//  PodcastListViewController.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 03/10/23.
//

import UIKit

class PodcastListViewController: UIViewController {
    // MARK: - Properties
    var presenter: PodcastListViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Podcast Unearthed"
    }
}

// MARK: - PodcastListPresenterToViewProtocol
extension PodcastListViewController: PodcastListPresenterToViewProtocol {
}
