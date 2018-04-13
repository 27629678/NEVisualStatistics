//
//  UIView+VisualStatistics.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 11/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import ObjectiveC
import SnapKit

private var kStatisticsMaskView: Int = 0

extension UIView {
    
    private var statisticsMaskView: UIView? {
        get {
            var mask = objc_getAssociatedObject(self, &kStatisticsMaskView) as? UIView
            if mask == nil {
                mask = VSMaskView(frame: CGRect.zero)
                objc_setAssociatedObject(self, &kStatisticsMaskView,
                                         mask, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            
            return mask
        }
    }
    
    func showStatisticsMaskView(_ hidden: Bool) -> Void {
        if eventID.count == 0 {
            return
        }
        
        #if DEBUG
        print("\(type(of: self)).hidden = \(hidden)")
        #endif
        
        if hidden {
            hiddenMaskView()
        }
        else {
            showMaskView()
        }
    }
    
    // MARK: private
    private func hiddenMaskView() -> Void {
        statisticsMaskView?.removeFromSuperview()
    }
    
    private func showMaskView() -> Void {
        guard statisticsMaskView?.superview == nil else {
            assert(false)
            return
        }
        
        addSubview(statisticsMaskView!)
        statisticsMaskView?.snp.makeConstraints({ (maker) in
            maker.edges.equalToSuperview()
        })
    }
}
