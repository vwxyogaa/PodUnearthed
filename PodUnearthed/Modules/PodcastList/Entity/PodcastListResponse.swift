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
        let collectionID, trackID: Int?
        let artistName, collectionName, trackName, collectionCensoredName: String?
        let trackCensoredName: String?
        let collectionViewURL, feedURL, trackViewURL: String?
        let artworkUrl30, artworkUrl60, artworkUrl100: String?
        let collectionPrice, trackPrice, collectionHDPrice: Int?
        let releaseDate: String?
        let collectionExplicitness, trackExplicitness: String?
        let trackCount, trackTimeMillis: Int?
        let country: String?
        let currency: String?
        let primaryGenreName: String?
        let contentAdvisoryRating: String?
        let artworkUrl600: String?
        let genreIDS, genres: [String]?
        let collectionArtistID: Int?
        let collectionArtistViewURL: String?
        let previewURL: String?
        let trackRentalPrice, trackHDPrice, trackHDRentalPrice, trackNumber: Int?
        let shortDescription, longDescription: String?
        let artistID: Int?
        let artistViewURL: String?
        let discCount, discNumber: Int?
        let isStreamable, hasITunesExtras: Bool?
        
        enum CodingKeys: String, CodingKey {
            case wrapperType, kind
            case collectionID = "collectionId"
            case trackID = "trackId"
            case artistName, collectionName, trackName, collectionCensoredName, trackCensoredName
            case collectionViewURL = "collectionViewUrl"
            case feedURL = "feedUrl"
            case trackViewURL = "trackViewUrl"
            case artworkUrl30, artworkUrl60, artworkUrl100, collectionPrice, trackPrice
            case collectionHDPrice = "collectionHdPrice"
            case releaseDate, collectionExplicitness, trackExplicitness, trackCount, trackTimeMillis, country, currency, primaryGenreName, contentAdvisoryRating, artworkUrl600
            case genreIDS = "genreIds"
            case genres
            case collectionArtistID = "collectionArtistId"
            case collectionArtistViewURL = "collectionArtistViewUrl"
            case previewURL = "previewUrl"
            case trackRentalPrice
            case trackHDPrice = "trackHdPrice"
            case trackHDRentalPrice = "trackHdRentalPrice"
            case trackNumber, shortDescription, longDescription
            case artistID = "artistId"
            case artistViewURL = "artistViewUrl"
            case discCount, discNumber, isStreamable, hasITunesExtras
        }
    }
}
