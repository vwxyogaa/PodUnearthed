//
//  RSSFeedItem+ Ext.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 30/10/23.
//

import FeedKit

typealias Audio = RSSFeedItem

extension RSSFeedItem {
  var url: String? {
    return enclosure?.attributes?.url
  }
  
  var pictureUrl: String? {
    return iTunes?.iTunesImage?.attributes?.href
  }
}
