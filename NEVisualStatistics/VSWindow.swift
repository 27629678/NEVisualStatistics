//
//  VSWindow.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 13/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit

public let kVisualStatisticsDidReceiveEventNotification = "com.netease.vs.didReceiveEventNotification"

open class VSWindow: UIWindow {

    override open func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        handle(event, for: view)
        
        return view
    }

    // MARK: private
    
    private func handle(_ event: UIEvent?, for view: UIView?) -> Void {
        guard event?.type == .touches else {
            return
        }
        
        if let control = view as? UIControl {
            control.installStatisticsComponents()
        }
    }
}
