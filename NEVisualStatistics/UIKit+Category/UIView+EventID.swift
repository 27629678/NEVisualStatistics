//
//  UIView+EventID.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 13/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

extension UIView {
    var eventID: String {
        get {
            var target: String?
            if isPrivateComponents(self, identifier: &target) {
                guard let id = target, id.count > 0 else {
                    return ""
                }
                
                return id
            }
            
            if let target = accessibilityIdentifier, target.count > 0 {
                return target
            }
            
            if let target = accessibilityLabel, target.count > 0 {
                return target
            }
            
            return ""
        }
    }
    
    private func isPrivateComponents(_ view: UIView?, identifier: inout String?) -> Bool {
        guard let target = view else { return false }
        
        if let cls = NSClassFromString("UITabBarButton"), target.isKind(of: cls) {
            identifier = tabButtonEventID
            
            return true
        }
        
        if let cls = NSClassFromString("_UIButtonBarButton"), target.isKind(of: cls) {
            identifier = navButtonEventID
            
            return true
        }
        
        if let cls = NSClassFromString("UINavigationButton"), target.isKind(of: cls) {
            identifier = navigationButtonEventID
            
            return true
        }
        
        return false
    }
}
