//
//  InstantiableFromStoryboard.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation
import UIKit

protocol InstantiableFromStoryboard where Self: UIViewController {
    static var appStoryboard: AppStoryboard { get }
}

extension InstantiableFromStoryboard {
    
    static func instantiateFromStoryboard() -> Self {
        return UIStoryboard.instantiate(viewController: String(describing: self), from: appStoryboard) as! Self
    }
}
