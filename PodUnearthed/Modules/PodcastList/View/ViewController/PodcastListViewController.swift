//
//  PodcastListViewController.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 03/10/23.
//

import UIKit

class PodcastListViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var podcastSearchBar: UISearchBar!
    @IBOutlet weak var comedyLabel: UILabel!
    @IBOutlet weak var comedyListCollectionView: UICollectionView!
    @IBOutlet weak var comedyListCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var horrorLabel: UILabel!
    @IBOutlet weak var horrorListCollectionView: UICollectionView!
    @IBOutlet weak var horrorListCollectionViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var sportLabel: UILabel!
    @IBOutlet weak var sportListCollectionView: UICollectionView!
    @IBOutlet weak var sportListCollectionViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Views
    private lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = .white
        return refreshControl
    }()
    
    // MARK: - Properties
    var presenter: PodcastListViewToPresenterProtocol?
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Podcast Unearthed"
        shouldHideBackButtonText = true
        initViews()
        initListener()
        initColectionView()
        presenter?.updateView()
    }
    
    // MARK: - Methods
    private func initViews() {
        scrollView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
    }
    
    private func initListener() {
        podcastSearchBar.delegate = self
    }
    
    private func initColectionView() {
        comedyLabel.text = "Comedy"
        comedyListCollectionView.register(UINib(nibName: "PodcastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PodcastCollectionViewCell")
        comedyListCollectionView.dataSource = self
        comedyListCollectionView.delegate = self
        
        horrorLabel.text = "Horror"
        horrorListCollectionView.register(UINib(nibName: "PodcastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PodcastCollectionViewCell")
        horrorListCollectionView.dataSource = self
        horrorListCollectionView.delegate = self
        
        sportLabel.text = "Sport"
        sportListCollectionView.register(UINib(nibName: "PodcastCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PodcastCollectionViewCell")
        sportListCollectionView.dataSource = self
        sportListCollectionView.delegate = self
        
        let cellHeight = (comedyListCollectionView.frame.width / 3) * 1.5
        comedyListCollectionViewHeightConstraint.constant = cellHeight
        horrorListCollectionViewHeightConstraint.constant = cellHeight
        sportListCollectionViewHeightConstraint.constant = cellHeight
        self.view.layoutIfNeeded()
    }
    
    // MARK: - Actions
    @objc
    private func refreshData() {
        presenter?.updateView()
        refreshControl.endRefreshing()
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension PodcastListViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case comedyListCollectionView:
            return presenter?.getPodcastComedyCount() ?? 0
        case horrorListCollectionView:
            return presenter?.getPodcastComedyCount() ?? 0
        case sportListCollectionView:
            return presenter?.getPodcastSportCount() ?? 0
        default:
            break
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case comedyListCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCollectionViewCell", for: indexPath) as? PodcastCollectionViewCell, let comedy = presenter?.getPodcastComedy(index: indexPath.row), let artworkUrl100 = comedy.artworkUrl100 else { return UICollectionViewCell() }
            cell.configureContent(artworkImage: artworkUrl100, trackName: comedy.trackName, artistName: comedy.artistName)
            return cell
        case horrorListCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCollectionViewCell", for: indexPath) as? PodcastCollectionViewCell, let horror = presenter?.getPodcastHorror(index: indexPath.row), let artworkUrl100 = horror.artworkUrl100 else { return UICollectionViewCell() }
            cell.configureContent(artworkImage: artworkUrl100, trackName: horror.trackName, artistName: horror.artistName)
            return cell
        case sportListCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCollectionViewCell", for: indexPath) as? PodcastCollectionViewCell, let sport = presenter?.getPodcastSport(index: indexPath.row), let artworkUrl100 = sport.artworkUrl100 else { return UICollectionViewCell() }
            cell.configureContent(artworkImage: artworkUrl100, trackName: sport.trackName, artistName: sport.artistName)
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case comedyListCollectionView:
            if  let comedy = presenter?.getPodcastComedy(index: indexPath.row) {
                let podcastDetailViewController = PodcastDetailRouter.createPodcastDetailModule(with: comedy)
                navigationController?.pushViewController(podcastDetailViewController, animated: true)
            }
        case horrorListCollectionView:
            if  let horror = presenter?.getPodcastHorror(index: indexPath.row) {
                let podcastDetailViewController = PodcastDetailRouter.createPodcastDetailModule(with: horror)
                navigationController?.pushViewController(podcastDetailViewController, animated: true)
            }
        case sportListCollectionView:
            if let sport = presenter?.getPodcastSport(index: indexPath.row) {
                let podcastDetailViewController = PodcastDetailRouter.createPodcastDetailModule(with: sport)
                navigationController?.pushViewController(podcastDetailViewController, animated: true)
            }
        default:
            break
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case comedyListCollectionView:
            let width = collectionView.frame.width / 3 // Divide by 3 columns
            let height = width * 1.5 // Height is longer than width
            return CGSize(width: width, height: height)
        case horrorListCollectionView:
            let width = collectionView.frame.width / 3 // Divide by 3 columns
            let height = width * 1.5 // Height is longer than width
            return CGSize(width: width, height: height)
        case sportListCollectionView:
            let width = collectionView.frame.width / 3 // Divide by 3 columns
            let height = width * 1.5 // Height is longer than width
            return CGSize(width: width, height: height)
        default:
            break
        }
        return CGSize(width: 0, height: 0)
    }
}

// MARK: - UISearchBarDelegate
extension PodcastListViewController: UISearchBarDelegate {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        let searchViewController = SearchRouter.createSearchModule()
        navigationController?.pushViewController(searchViewController, animated: true)
        return false
    }
}

// MARK: - PodcastListPresenterToViewProtocol
extension PodcastListViewController: PodcastListPresenterToViewProtocol {
    func showLoading(isLoading: Bool) {
        switch isLoading {
        case false:
            self.manageLoadingActivity(isLoading: false)
            self.comedyListCollectionView.isHidden = false
            self.horrorListCollectionView.isHidden = false
            self.sportListCollectionView.isHidden = false
        case true:
            self.manageLoadingActivity(isLoading: true)
            self.comedyListCollectionView.isHidden = true
            self.horrorListCollectionView.isHidden = true
            self.sportListCollectionView.isHidden = true
        }
    }
    
    // MARK: - Comedy
    func showPodcastComedy() {
        comedyListCollectionView.reloadData()
    }
    
    func showErrorPodcastComedy() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching podcast comedy", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Horror
    func showPodcastHorror() {
        horrorListCollectionView.reloadData()
    }
    
    func showErrorPodcastHorror() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching podcast horror", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    // MARK: - Sport
    func showPodcastSport() {
        sportListCollectionView.reloadData()
    }
    
    func showErrorPodcastSport() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching podcast sport", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
