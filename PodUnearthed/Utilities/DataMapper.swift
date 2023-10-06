//
//  DataMapper.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 05/10/23.
//

final class DataMapper {
    static func mapPodcastListResponseToModel(data: [PodcastListResponse.Podcast]) -> PodcastListModel {
        var artworkUrl100 = [String]()
        var artworkUrl600 = [String]()
        var trackId = [Int]()
        var trackName = [String]()
        var artistName = [String]()
        var feedUrl = [String]()
        
        for podcast in data {
            if let url100 = podcast.artworkUrl100 {
                artworkUrl100.append(url100)
            }
            if let url600 = podcast.artworkUrl600 {
                artworkUrl600.append(url600)
            }
            if let id = podcast.trackId {
                trackId.append(id)
            }
            if let name = podcast.trackName {
                trackName.append(name)
            }
            if let artist = podcast.artistName {
                artistName.append(artist)
            }
            if let feed = podcast.feedUrl {
                feedUrl.append(feed)
            }
        }
        
        return PodcastListModel(
            artworkUrl100: artworkUrl100,
            artworkUrl600: artworkUrl600,
            trackId: trackId,
            trackName: trackName,
            artistName: artistName,
            feedUrl: feedUrl
        )
    }
}
