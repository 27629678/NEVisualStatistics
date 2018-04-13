//
//  VSMaskView.swift
//  NEVisualStatistics
//
//  Created by hzyuxiaohua on 12/04/2018.
//  Copyright © 2018 hzyuxiaohua. All rights reserved.
//

import UIKit
import SnapKit

class VSMaskView: UIView {
    
    // MARK: override
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let btn = UIButton(type: .custom)
        btn.addTarget(self, action: #selector(btnAction(_:)), for: .touchUpInside)

        addSubview(btn)
        btn.snp.makeConstraints { (maker) in
            maker.edges.equalToSuperview()
        }
        
        backgroundColor = randomBackgroundColor(0.3)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // MARK: private
    @objc private func btnAction(_ sender: UIButton) -> Void {
        guard let identifier = superview?.accessibilityIdentifier else {
            return
        }
        
        print("item-\(identifier) clicked.")
    }
    
    private func randomBackgroundColor(_ alpha: Float) -> UIColor {
        return UIColor(red: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       green: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       blue: CGFloat((Float(arc4random_uniform(100)) + 100) / 255.0),
                       alpha: CGFloat(alpha))
    }
}
