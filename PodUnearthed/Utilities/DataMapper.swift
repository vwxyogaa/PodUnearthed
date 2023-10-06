//
//  DataMapper.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 05/10/23.
//

final class DataMapper {
    static func mapPodcastListResponseToModel(data: [PodcastListResponse.Podcast]) -> [PodcastListModel] {
        return data.compactMap { podcast in
            return PodcastListModel(
                artworkUrl100: podcast.artworkUrl100,
                artworkUrl600: podcast.artworkUrl600,
                trackId: podcast.trackId,
                trackName: podcast.trackName,
                artistName: podcast.artistName,
                collectionName: podcast.collectionName,
                feedUrl: podcast.feedUrl
            )
        }
    }
}
