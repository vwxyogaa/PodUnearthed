//
//  DataMapper.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 05/10/23.
//

final class DataMapper {
    static func mapPodcastListResponseToModel(data: [PodcastListResponse.Podcast]) -> PodcastListModel {
        var artworkUrl100 = [String]()
        var trackId = [Int]()
        var trackName = [String]()
        var artistName = [String]()
        
        for podcast in data {
            if let url100 = podcast.artworkUrl100 {
                artworkUrl100.append(url100)
            }
            if let id = podcast.trackID {
                trackId.append(id)
            }
            if let name = podcast.trackName {
                trackName.append(name)
            }
            if let artist = podcast.artistName {
                artistName.append(artist)
            }
        }
        
        return PodcastListModel(
            artworkUrl100: artworkUrl100,
            trackId: trackId,
            trackName: trackName,
            artistName: artistName
        )
    }
}
