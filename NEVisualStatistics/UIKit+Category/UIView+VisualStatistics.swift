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
        guard let identifier = (accessibilityIdentifier ?? accessibilityLabel), identifier.count > 0 else {
            return
        }
        
        #if DEBUG
        print("\(type(of: self)).hidden = \(hidden)")
        #endif
        
        if hidden {
            statisticsMaskView?.removeFromSuperview()
            return
        }
        
        guard statisticsMaskView?.superview == nil else {
            return
        }
        
        addSubview(statisticsMaskView!)
        statisticsMaskView?.snp.makeConstraints({ (maker) in
            maker.edges.equalToSuperview()
        })
        statisticsMaskView?.backgroundColor = randomBackgroundColor(0.3)
    }
    
    // MARK: private
    private func randomBackgroundColor(_ alpha: Float) -> UIColor {
        return UIColor(red: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       green: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       blue: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       alpha: CGFloat(alpha))
    }
}
