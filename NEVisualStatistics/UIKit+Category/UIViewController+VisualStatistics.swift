//
//  UIViewController+VisualStatistics.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 12/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

extension UIViewController {
    
    func showStatisticsMaskView(hidden: Bool) -> Void {
        if (tabBarController != nil) {
            handle((tabBarController?.view)!, hidden: hidden)
            
            return
        }
        
        if (navigationController != nil) {
            handle((navigationController?.view)!, hidden: hidden)
            
            return
        }
        
        handle(view, hidden: hidden)
    }
    
    // MARK: private
    private func handle(_ view: UIView, hidden: Bool) -> Void {
        if view.subviews.count == 0 {
            if view.isKind(of: UIControl.self) {
                view.showStatisticsMaskView(hidden)
            }
            
            return
        }
        
        // omit _UIButtonBarButton class object
        if #available(iOS 11.0, *) {
            if view.isKind(of: NSClassFromString("_UIButtonBarButton")!) {
                view.showStatisticsMaskView(hidden)
                
                return
            }
        }
        
        for subview in view.subviews {
            handle(subview, hidden: hidden)
        }
        
        if view.isKind(of: UIControl.self) {
            view.showStatisticsMaskView(hidden)
        }
    }
}
