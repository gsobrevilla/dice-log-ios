//
//  UIStoryboard+InstantiateViewController.swift.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation
import UIKit

extension UIStoryboard {
    
    static func instantiate(viewController viewControllerName: String, from appStoryboard: AppStoryboard) -> UIViewController {
        return UIStoryboard(name: appStoryboard.storyboardName, bundle: .main).instantiateViewController(withIdentifier: viewControllerName)
    }
}
