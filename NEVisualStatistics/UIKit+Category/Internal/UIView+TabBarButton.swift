//
//  UIView+TabBarButton.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 13/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

extension UIView {
    var tabButtonEventID: String {
        get {
            guard let actions: [Any] = value(forKey: "targetActions") as? [Any] else { return "" }
            guard let action = actions.first as? NSObject else { return "" }
            guard let tabBar = action.value(forKey: "target") as? UITabBar else { return "" }
            
            return "com.app.tab_\(allTabBarButtonItems(of: tabBar).index(of: self) ?? -1)"
        }
    }
    
    private func allTabBarButtonItems(of tabBar: UITabBar) -> [UIView] {
        guard let cls = NSClassFromString("UITabBarButton") else { return [] }
        
        var buttons: [UIView] = []
        for view in tabBar.subviews {
            if view.isKind(of: cls) {
                buttons.append(view)
            }
        }
        
        return buttons.sorted(by: { (lh, rh) -> Bool in
            return lh.frame.origin.x < rh.frame.origin.x
        })
    }
}
