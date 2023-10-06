//
//  PodcastDetailInteractor.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import FeedKit

class PodcastDetailInteractor: PodcastDetailPresenterToInteractorProtocol {
    // MARK: - Properties
    var presenter: PodcastDetailInteractorToPresenterProtocol?
    var podcastDetail: PodcastListModel?
    var rssFeed: RSSFeed?
    
    init(podcast: PodcastListModel) {
        self.podcastDetail = podcast
    }
    
    // MARK: - Methods
    func fetchPodcastDetail() {
        if let feedUrl = podcastDetail?.feedUrl {
            let url = URL(string: feedUrl)!
            let parser = FeedParser(URL: url)
            parser.parseAsync(queue: DispatchQueue.global(qos: .userInitiated)) { result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let success):
                        self.rssFeed = success.rssFeed
                        self.presenter?.podcastDetailFetched()
                    case .failure(let failure):
                        print(failure)
                        self.presenter?.podcastDetailFetchedFailed()
                    }
                }
            }
        } else {
            print("Feed Url is nil")
        }
    }
}
