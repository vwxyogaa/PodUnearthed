//
//  PodcastListResponse.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 03/10/23.
//

import Foundation

struct PodcastListResponse: Codable {
    let resultCount: Int?
    let results: [Podcast]?
    
    struct Podcast: Codable {
        let wrapperType: String?
        let kind: String?
        let collectionId, trackId: Int?
        let artistName, collectionName, trackName, collectionCensoredName: String?
        let trackCensoredName: String?
        let collectionViewUrl, feedUrl, trackViewUrl: String?
        let artworkUrl30, artworkUrl60, artworkUrl100: String?
        let collectionPrice, trackPrice, collectionHdPrice: Int?
        let releaseDate: String?
        let collectionExplicitness, trackExplicitness: String?
        let trackCount, trackTimeMillis: Int?
        let country: String?
        let currency: String?
        let primaryGenreName: String?
        let contentAdvisoryRating: String?
        let artworkUrl600: String?
        let genreIds, genres: [String]?
        let collectionArtistId: Int?
        let collectionArtistViewUrl: String?
        let previewUrl: String?
        let trackRentalPrice, trackHdPrice, trackHdRentalPrice, trackNumber: Int?
        let shortDescription, longDescription: String?
        let artistId: Int?
        let artistViewUrl: String?
        let discCount, discNumber: Int?
        let isStreamable, hasITunesExtras: Bool?
    }
}
