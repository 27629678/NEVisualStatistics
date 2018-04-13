//
//  NEWindow.swift
//  demo
//
//  Created by hzyuxiaohua on 13/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit
import NEVisualStatistics

class NEWindow: VSWindow, NEVisualStatisticsDelegate {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NEVisualStatistics.shared.delegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: delegate
    
    func visualStatistics(didReceive event: String?) {
        print("event:\(event!) occured")
    }
    
    func visualStatistics(clickOnMask view: UIView?, event: String?) {
        print("will show detail view for event:\(event!).")
    }
}
