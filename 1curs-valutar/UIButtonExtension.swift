//
//  UIButtonExtension.swift
//  1curs-valutar
//
//  Created by Dan Pop on 02/05/2019.
//  Copyright © 2019 Archlime. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
    func flash() {
        
        let flash = CABasicAnimation(keyPath: "opacity")
        flash.duration = 0.5
        flash.fromValue = 1
        flash.toValue = 0.5
        flash.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        flash.autoreverses = true
        flash.repeatCount = 2
        
        layer.add(flash, forKey: nil)
        
    }
    
}
