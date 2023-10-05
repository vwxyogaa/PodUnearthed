//
//  UIImageView+Ext.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 05/10/23.
//

import UIKit
import Kingfisher

// MARK: - Kingfisher Load Image
extension UIImageView {
    func loadImage(uri: String?, placeholder: UIImage? = nil) {
        guard let uri = uri, let uriImage = URL(string: uri) else { return }
        self.kf.setImage(with: uriImage, placeholder: placeholder)
    }
}
