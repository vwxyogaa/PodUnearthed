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
        let url = Constants.baseUrl + "/search?term=comedy&country=id&limit=10"
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: PodcastListResponse.self) { response in
                switch response.result {
                case .success(let value):
                    let podcastList = value.results.map({ DataMapper.mapPodcastListResponseToModel(data: $0) })
                    self.podcastComedy = podcastList
                    self.presenter?.podcastComedyFetched()
                case .failure(let error):
                    print(error)
                    self.presenter?.podcastComedyFetchedFailed()
                }
            }
    }
    
    func fetchPodcastHorror() {
        let url = Constants.baseUrl + "/search?term=horror&country=id&limit=10"
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: PodcastListResponse.self) { response in
                switch response.result {
                case .success(let value):
                    let podcastList = value.results.map({ DataMapper.mapPodcastListResponseToModel(data: $0) })
                    self.podcastHorror = podcastList
                    self.presenter?.podcastHorrorFetched()
                case .failure(let error):
                    print(error)
                    self.presenter?.podcastHorrorFetchedFailed()
                }
            }
    }
    
    func fetchPodcastSport() {
        let url = Constants.baseUrl + "/search?term=sport&country=id&limit=10"
        AF.request(url, method: .get)
            .validate()
            .responseDecodable(of: PodcastListResponse.self) { response in
                switch response.result {
                case .success(let value):
                    let podcastList = value.results.map({ DataMapper.mapPodcastListResponseToModel(data: $0) })
                    self.podcastSport = podcastList
                    self.presenter?.podcastSportFetched()
                case .failure(let error):
                    print(error)
                    self.presenter?.podcastSportFetchedFailed()
                }
            }
    }
}
