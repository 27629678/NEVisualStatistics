//
//  UIControl+StatisticsEvent.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 13/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import ObjectiveC

private var kHasStatisticsComponentsInstalled: Int = 0

extension UIControl {
    
    private var hasStatisticsComponentsInstalled: Bool {
        set {
            objc_setAssociatedObject(self, &kHasStatisticsComponentsInstalled,
                                     newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            return objc_getAssociatedObject(self, &kHasStatisticsComponentsInstalled) as? Bool ?? false
        }
    }
    
    func installStatisticsComponents() -> Void {
        if hasStatisticsComponentsInstalled {
            return
        }
        
        hasStatisticsComponentsInstalled = true
        addTarget(self, action: #selector(statisticsEventAction(_:)), for: .touchUpInside)
    }
    
    func uninstallStatisticsComponents() -> Void {
        if !hasStatisticsComponentsInstalled {
            return
        }
        
        hasStatisticsComponentsInstalled = false
        removeTarget(self, action: #selector(statisticsEventAction(_:)), for: .touchUpInside)
    }
    
    // MARK: private
    @objc private func statisticsEventAction(_ sender: UIControl?) -> Void {
        guard eventID.count > 0 else {
            return
        }
        
        NEVisualStatistics.receive(eventID, sender: sender)
    }
    
}
