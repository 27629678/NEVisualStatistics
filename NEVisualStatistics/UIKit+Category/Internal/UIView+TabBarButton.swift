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
            guard let target = action.value(forKey: "target") as? UITabBar else { return "" }
            
            return target.accessibilityIdentifier ?? target.accessibilityLabel ?? ""
        }
    }
}
