//
//  NSNotificationName+Ext.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 30/10/23.
//

import Foundation

extension NSNotification.Name {
  static let PlayerProviderStateDidChange: NSNotification.Name = NSNotification.Name(rawValue: "PlayerProviderStateDidChange")
  static let PlayerProviderNowPlayingInfoDidChange: NSNotification.Name = NSNotification.Name(rawValue: "PlayerProviderNowPlayingInfoDidChange")
}
