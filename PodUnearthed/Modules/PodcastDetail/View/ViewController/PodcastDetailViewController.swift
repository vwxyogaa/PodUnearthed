//
//  PodcastDetailViewController.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import UIKit

class PodcastDetailViewController: UIViewController {
    // MARK: - IBOutlers
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var collectionNameLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var categoriesLabel: UILabel!
    @IBOutlet weak var episodeTableView: UITableView!
    @IBOutlet weak var episodeTableViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    var presenter: PodcastDetailViewToPresenterProtocol?
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        shouldHideBackButtonText = true
        initViews()
        initTableView()
        presenter?.updateView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        episodeTableView.addObserver(self, forKeyPath: UITableView.contentSizeKeyPath, options: .new, context: nil)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        episodeTableView.removeObserver(self, forKeyPath: UITableView.contentSizeKeyPath, context: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let newValue = change?[.newKey], keyPath == UITableView.contentSizeKeyPath {
            let size = newValue as! CGSize
            updateTableViewContentSize(size: size.height)
        }
    }
    
    // MARK: - Methods
    private func initViews() {
        artworkImageView.layer.cornerRadius = 12
        artworkImageView.layer.masksToBounds = true
    }
    
    private func initTableView() {
        episodeTableViewHeightConstraint.constant = 0
        episodeTableView.register(UINib(nibName: "EpisodeTableViewCell", bundle: nil), forCellReuseIdentifier: "EpisodeTableViewCell")
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
    }
    
    private func updateTableViewContentSize(size: CGFloat) {
        episodeTableViewHeightConstraint.constant = size
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension PodcastDetailViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getRssFeed()?.items?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EpisodeTableViewCell", for: indexPath) as? EpisodeTableViewCell, let episode = presenter?.getRssFeed()?.items?[indexPath.row] else { return UITableViewCell() }
        let imageUrl = episode.iTunes?.iTunesImage?.attributes?.href
        let pubDateLabel = episode.pubDate?.toString(with: .serverDateWithTimeAndTandZ)
        let title = episode.title
        let description = episode.description
        let duration = episode.iTunes?.iTunesDuration?.string
        cell.configureContent(imageUrl: imageUrl, pubDate: pubDateLabel, title: title, description: description, duration: duration)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let rssFeed = presenter?.getRssFeed()?.items
        let headerView = UIView()
        headerView.backgroundColor = .clear
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "\(rssFeed?.count ?? 0) Episode"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.textColor = .white
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
}

// MARK: - PodcastDetailPresenterToViewProtocol
extension PodcastDetailViewController: PodcastDetailPresenterToViewProtocol {
    func showPodcastDetail() {
        let podcast = presenter?.getPodcastDetail()
        if let imageUrl = podcast?.artworkUrl600, !imageUrl.isEmpty {
            self.artworkImageView.loadImage(uri: imageUrl)
        } else {
            self.artworkImageView.backgroundColor = .darkGray
        }
        collectionNameLabel.text = podcast?.collectionName
        artistNameLabel.text = podcast?.artistName
        
        let rssFeed = presenter?.getRssFeed()
        descriptionLabel.attributedText = rssFeed?.description?
            .convertHtmlToAttributedStringWithCSS(
                font: UIFont.systemFont(ofSize: 14, weight: .regular),
                cssColor: "#EEEEEE",
                lineHeight: 18,
                cssTextAlign: "left"
            )
        categoriesLabel.text = rssFeed?.iTunes?.iTunesCategories?
            .compactMap({ $0.attributes?.text })
            .joined(separator: " • ")
        
        episodeTableView.reloadData()
    }
    
    func showErrorPodcastDetail() {
        let alert = UIAlertController(title: "Oops!", message: "Failed fetching podcast detail", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
