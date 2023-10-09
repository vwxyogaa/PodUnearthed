//
//  PodcastListInteractor.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 03/10/23.
//

import Alamofire

class PodcastListInteractor: PodcastListPresenterToInteractorProtocol {
    // MARK: - Properties
    var presenter: PodcastListInteractorToPresenterProtocol?
    var podcastComedy: [PodcastListModel]?
    var podcastHorror: [PodcastListModel]?
    var podcastSport: [PodcastListModel]?
    
    // MARK: - Methods
    func fetchPodcastComedy() {
        self.presenter?.isLoading(isLoading: true)
        let parameter: [String: Any] = ["term": "comedy", "country": "id", "media": "podcast", "limit": "10"]
        let url = Constants.baseUrl + "/search"
        AF.request(url, method: .get, parameters: parameter)
            .validate()
            .responseDecodable(of: PodcastListResponse.self) { response in
                self.presenter?.isLoading(isLoading: false)
                switch response.result {
                case .success(let value):
                    let podcastList = value.results.map({ DataMapper.mapPodcastListResponseToModel(data: $0) })
                    self.podcastComedy = podcastList
                    self.presenter?.podcastComedyFetched()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.presenter?.podcastComedyFetchedFailed()
                }
            }
    }
    
    func fetchPodcastHorror() {
        self.presenter?.isLoading(isLoading: true)
        let parameter: [String: Any] = ["term": "horror", "country": "id", "media": "podcast", "limit": "10"]
        let url = Constants.baseUrl + "/search"
        AF.request(url, method: .get, parameters: parameter)
            .validate()
            .responseDecodable(of: PodcastListResponse.self) { response in
                self.presenter?.isLoading(isLoading: false)
                switch response.result {
                case .success(let value):
                    let podcastList = value.results.map({ DataMapper.mapPodcastListResponseToModel(data: $0) })
                    self.podcastHorror = podcastList
                    self.presenter?.podcastHorrorFetched()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.presenter?.podcastHorrorFetchedFailed()
                }
            }
    }
    
    func fetchPodcastSport() {
        self.presenter?.isLoading(isLoading: true)
        let parameter: [String: Any] = ["term": "sport", "country": "id", "media": "podcast", "limit": "10"]
        let url = Constants.baseUrl + "/search"
        AF.request(url, method: .get, parameters: parameter)
            .validate()
            .responseDecodable(of: PodcastListResponse.self) { response in
                self.presenter?.isLoading(isLoading: false)
                switch response.result {
                case .success(let value):
                    let podcastList = value.results.map({ DataMapper.mapPodcastListResponseToModel(data: $0) })
                    self.podcastSport = podcastList
                    self.presenter?.podcastSportFetched()
                case .failure(let error):
                    print(error.localizedDescription)
                    self.presenter?.podcastSportFetchedFailed()
                }
            }
    }
}
