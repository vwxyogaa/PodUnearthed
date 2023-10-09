//
//  SearchViewController.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 09/10/23.
//

import UIKit

class SearchViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var podcastSearchBar: UISearchBar!
    @IBOutlet weak var podcastListTableView: UITableView!
    
    // MARK: - Properties
    var presenter: SearchViewToPresenterProtocol?
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Search"
        initListener()
        initTableView()
    }
    
    // MARK: - Methods
    private func initListener() {
        podcastSearchBar.delegate = self
    }
    
    private func initTableView() {
        podcastListTableView.register(UINib(nibName: "PodcastTableViewCell", bundle: nil), forCellReuseIdentifier: "PodcastTableViewCell")
        podcastListTableView.dataSource = self
        podcastListTableView.delegate = self
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension SearchViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getPodcastCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PodcastTableViewCell", for: indexPath) as? PodcastTableViewCell, let podcast = presenter?.getPodcast(index: indexPath.row), let artworkUrl100 = podcast.artworkUrl100 else { return UITableViewCell() }
        cell.configureContent(artworkImage: artworkUrl100, trackName: podcast.trackName, artistName: podcast.artistName)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let podcast = presenter?.getPodcast(index: indexPath.row) {
            let podcastDetailViewController = PodcastDetailRouter.createPodcastDetailModule(with: podcast)
            navigationController?.pushViewController(podcastDetailViewController, animated: true)
        }
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        presenter?.updateView(term: searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let string = NSString(string: searchBar.text ?? "").replacingCharacters(in: range, with: text)
        if string.count >= 3 {
            presenter?.updateView(term: string)
        }
        return true
    }
}

// MARK: - SearchPresenterToViewProtocol
extension SearchViewController: SearchPresenterToViewProtocol {
    func showLoading(isLoading: Bool) {
        switch isLoading {
        case false:
            self.manageLoadingActivity(isLoading: false)
        case true:
            self.manageLoadingActivity(isLoading: true)
        }
    }
    
    func showPodcast() {
        podcastListTableView.reloadData()
    }
    
    func showErrorPodcast() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching podcast", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
