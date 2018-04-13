//
//  NEWindow.swift
//  demo
//
//  Created by hzyuxiaohua on 13/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit
import NEVisualStatistics

class NEWindow: VSWindow {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        NotificationCenter
            .default
            .addObserver(self, selector: #selector(visualStatistic(didReceive:)),
                         name: NSNotification.Name(rawValue: kVisualStatisticsDidReceiveEventNotification), object: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: private
    
    @objc private func visualStatistic(didReceive notification: NSNotification?) -> Void {
        guard let event = notification?.userInfo?.first else { return }
        
        print("event:\(event.value) occured")
    }
}
