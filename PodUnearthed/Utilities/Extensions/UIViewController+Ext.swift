//
//  UIViewController+Ext.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 06/10/23.
//

import UIKit

// MARK: - Back Button No Text
extension UIViewController {
    var shouldHideBackButtonText: Bool {
        get {
            return false
        }
        set {
            if newValue {
                let backButton = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
                navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
                navigationController?.navigationBar.tintColor = .white
            } else {
                navigationController?.navigationBar.tintColor = .systemBlue
            }
        }
    }
}
