//
//  PodcastListModel.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 05/10/23.
//

import Foundation

struct PodcastListModel: Codable {
    let artworkUrl100: [String]?
    let trackId: [Int]?
    let trackName: [String]?
    let artistName: [String]?
    
    enum CodingKeys: String, CodingKey {
        case artworkUrl100
        case trackId
        case trackName
        case artistName
    }
}
