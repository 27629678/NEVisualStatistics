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
    private var eventID: String {
        get {
            var target: String?
            if isPrivateComponents(self, identifier: &target) {
                guard let id = target, id.count > 0 else {
                    return ""
                }
                
                return id
            }
            
            if let target = accessibilityIdentifier, target.count > 0 {
                return target
            }
            
            if let target = accessibilityLabel, target.count > 0 {
                return target
            }
            
            return ""
        }
    }
    
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
        statisticsMaskView?.backgroundColor = randomBackgroundColor(0.3)
    }
    
    private func randomBackgroundColor(_ alpha: Float) -> UIColor {
        return UIColor(red: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       green: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       blue: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       alpha: CGFloat(alpha))
    }
    
    private func isPrivateComponents(_ view: UIView?, identifier: inout String?) -> Bool {
        guard let target = view else { return false }
        
        if let cls = NSClassFromString("UITabBarButton"), target.isKind(of: cls) {
            identifier = "1"
            
            return true
        }
        
        return false
    }
}
