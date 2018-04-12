//
//  NEVisualStatistics.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 12/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import Foundation

public class NEVisualStatistics {
    
    public class func showMaskView() -> Void {
        UIApplication.shared.keyWindow?.rootViewController?.showStatisticsMaskView(hidden: false)
    }
    
    public class func hideMaskView() -> Void {
        UIApplication.shared.keyWindow?.rootViewController?.showStatisticsMaskView(hidden: true)
    }
    
    // MARK: private
    
    
}
