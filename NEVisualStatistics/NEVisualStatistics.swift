//
//  NEVisualStatistics.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 12/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import Foundation

@objc
public protocol NEVisualStatisticsDelegate: NSObjectProtocol {
    func visualStatistics(didReceive event: String?);
    
    func visualStatistics(clickOnMask view: UIView?, event: String?);
}

public class NEVisualStatistics: NSObject {
    
    public static let shared = NEVisualStatistics()
    
    public weak var delegate: NEVisualStatisticsDelegate?
    
    public class func showMaskView() -> Void {
        UIApplication.shared.keyWindow?.rootViewController?.showStatisticsMaskView(hidden: false)
    }
    
    public class func hideMaskView() -> Void {
        UIApplication.shared.keyWindow?.rootViewController?.showStatisticsMaskView(hidden: true)
    }
    
    // MARK: private
    
    class func receive(_ event: String?, sender: UIControl?) -> Void {
        shared.delegate?.visualStatistics(didReceive: event)
    }
    
    class func show(detailWithEvent event: String?, forView view: UIControl?) -> Void {
        shared.delegate?.visualStatistics(clickOnMask: view!, event: event)
    }
}
