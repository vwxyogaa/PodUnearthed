//
//  PodcastListModel.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 05/10/23.
//

import Foundation

struct PodcastListModel: Codable {
    let artworkUrl100: [String]?
    let artworkUrl600: [String]?
    let trackId: [Int]?
    let trackName: [String]?
    let artistName: [String]?
    let feedUrl: [String]?
    
    enum CodingKeys: String, CodingKey {
        case artworkUrl100
        case artworkUrl600
        case trackId
        case trackName
        case artistName
        case feedUrl
    }
}
