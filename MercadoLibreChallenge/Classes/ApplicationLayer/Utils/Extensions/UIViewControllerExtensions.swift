//
//  UIViewControllerExtensions.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation
import UIKit
import MBProgressHUD
import CoreBluetooth

fileprivate var aView: UIView?

extension UIViewController {
    func showSpinner() {
        DispatchQueue.main.async {
            if aView != nil && self.view.subviews.contains(aView!) { return }
            aView = (self.parent != nil) ? UIView(frame: self.parent!.view.bounds) : UIView(frame: self.view.bounds)
            guard let containerView = aView else { return }
            containerView.backgroundColor = UIColor.clear
            MBProgressHUD.showAdded(to: containerView, animated: true)
            self.view.addSubview(containerView)
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: aView ?? self.view, animated: true)
            aView?.removeFromSuperview()
            aView = nil
        }
    }
}

extension UIViewController: Presentable {
    
    func toPresent() -> UIViewController? {
        return self
    }
}
