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
        configureViews()
        initColectionView()
        presenter?.updateView()
    }
    
    // MARK: - Methods
    private func configureViews() {
        scrollView.refreshControl = refreshControl
        refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)
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
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCollectionViewCell", for: indexPath) as? PodcastCollectionViewCell, let comedy = presenter?.getPodcastComedy(), let artworkUrl100 = comedy.artworkUrl100 else { return UICollectionViewCell() }
            cell.configureContent(artworkImage: artworkUrl100[indexPath.row], trackName: comedy.trackName?[indexPath.row], artistName: comedy.artistName?[indexPath.row])
            return cell
        case horrorListCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCollectionViewCell", for: indexPath) as? PodcastCollectionViewCell, let horror = presenter?.getPodcastHorror(), let artworkUrl100 = horror.artworkUrl100 else { return UICollectionViewCell() }
            cell.configureContent(artworkImage: artworkUrl100[indexPath.row], trackName: horror.trackName?[indexPath.row], artistName: horror.artistName?[indexPath.row])
            return cell
        case sportListCollectionView:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PodcastCollectionViewCell", for: indexPath) as? PodcastCollectionViewCell, let sport = presenter?.getPodcastSport(), let artworkUrl100 = sport.artworkUrl100 else { return UICollectionViewCell() }
            cell.configureContent(artworkImage: artworkUrl100[indexPath.row], trackName: sport.trackName?[indexPath.row], artistName: sport.artistName?[indexPath.row])
            return cell
        default:
            break
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case comedyListCollectionView:
            guard let comedy = presenter?.getPodcastComedy() else { return }
            print("comedy clicked: \(indexPath.row + 1): \(comedy)")
        case horrorListCollectionView:
            guard let horror = presenter?.getPodcastHorror() else { return }
            print("horror clicked: \(indexPath.row + 1): \(horror)")
        case sportListCollectionView:
            guard let sport = presenter?.getPodcastSport() else { return }
            print("sport clicked: \(indexPath.row + 1): \(sport)")
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

// MARK: - PodcastListPresenterToViewProtocol
extension PodcastListViewController: PodcastListPresenterToViewProtocol {
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
