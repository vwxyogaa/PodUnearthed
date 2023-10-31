//
//  UIView+Ext.swift
//  PodUnearthed
//
//  Created by Panji Yoga on 30/10/23.
//

import UIKit

extension UIView {
    func manageLoadingActivity(isLoading: Bool) {
        if isLoading {
            showLoadingActivity()
        } else {
            hideLoadingActivity()
        }
    }
    
    func showLoadingActivity() {
        self.makeToastActivity(.center)
    }
    
    func hideLoadingActivity() {
        self.hideToastActivity()
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
        self.makeToastActivity(.center)
        self.isUserInteractionEnabled = false
    }
    
    func hideLoadingActivityNoInteraction() {
        self.hideToastActivity()
        self.isUserInteractionEnabled = true
    }
}
