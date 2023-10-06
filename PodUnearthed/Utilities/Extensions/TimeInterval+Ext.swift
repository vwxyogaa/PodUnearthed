//
//  TimeInterval+Ext.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import Foundation

extension TimeInterval {
    var string: String {
        let timeInterval = Int(self)
        
        let seconds = timeInterval % 60
        let minutes = (timeInterval / 60) % 60
        let hours = (timeInterval / 3600)
        
        return String(format: "%0.2d:%0.2d:%0.2d", hours, minutes, seconds)
    }
}
