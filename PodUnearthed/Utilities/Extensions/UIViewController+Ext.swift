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

// MARK: - Manage Loading View
extension UIViewController {
    func manageLoadingActivity(isLoading: Bool) {
        if isLoading {
            showLoadingActivity()
        } else {
            hideLoadingActivity()
        }
    }
    
    func showLoadingActivity() {
        self.view.makeToastActivity(.center)
    }
    
    func hideLoadingActivity() {
        self.view.hideToastActivity()
    }
    
    // No User Interaction
    func manageLoadingActivityNoInteraction(isLoading: Bool) {
        if isLoading {
            showLoadingActivityNoInteraction()
        } else {
            hideLoadingActivityNoInteraction()
        }
    }
    
    func showLoadingActivityNoInteraction() {
        self.view.makeToastActivity(.center)
        self.view.isUserInteractionEnabled = false
    }
    
    func hideLoadingActivityNoInteraction() {
        self.view.hideToastActivity()
        self.view.isUserInteractionEnabled = true
    }
}
