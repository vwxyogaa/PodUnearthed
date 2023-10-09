//
//  SearchInteractor.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 09/10/23.
//

import Alamofire

class SearchInteractor: SearchPresenterToInteractorProtocol {
    // MARK: - Properties
    var presenter: SearchInteractorToPresenterProtocol?
    var podcast: [PodcastListModel]?
    
    // MARK: - Methods
    func fetchPodcast(term: String?) {
        self.presenter?.isLoading(isLoading: true)
        let parameter: [String: Any] = ["term": term ?? "", "media": "podcast", "limit": "50"]
        let url = Constants.baseUrl + "/search"
        AF.request(url, method: .get, parameters: parameter)
            .validate()
            .responseDecodable(of: PodcastListResponse.self) { response in
                self.presenter?.isLoading(isLoading: false)
                switch response.result {
                case .success(let value):
                    let podcastList = value.results.map({ DataMapper.mapPodcastListResponseToModel(data: $0) })
                    self.podcast = podcastList
                    self.presenter?.podcastFetched()
                case .failure(let errpr):
                    print(errpr.localizedDescription)
                    self.presenter?.podcastFetchedFailed()
                }
            }
    }
}
