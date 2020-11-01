//
//  CGRect.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 01/11/2020.
//

import Foundation
import UIKit

extension CGRect {
    
    // TODO: document
    func addingPadding(_ insets: UIEdgeInsets)  -> CGRect {
        return inset(by: insets)
    }
    
    // TODO: document
    func multiplyingWidth(by factor: CGFloat) -> CGRect {
        let newWidth = width * factor
        return changing(width: newWidth)
    }
    
    // TODO: document
    func changing(x: CGFloat) -> CGRect {
        return CGRect(x: x, y: self.minY, width: self.width, height: self.height)
    }
    
    // TODO: document
    func movingRightBy(_ value: CGFloat) -> CGRect {
        return changing(x: minX + value)
    }
    
    func cuttingLeftBy(_ value: CGFloat) -> CGRect {
        return movingRightBy(value).changing(width: width - value)
        
    }
    
    // TODO: document
    func changing(width: CGFloat) -> CGRect {
        return CGRect(x: self.minX, y: self.minY, width: width, height: self.height)
    }
}

// TODO: move me
extension UIEdgeInsets {
    
    // TODO: document
    var horizontal: CGFloat {
        return left + right
    }
    
    // TODO: document
    var vertical: CGFloat {
        return top + bottom
    }
    
    static func regular(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: value, bottom: value, right: value)
    }
}
