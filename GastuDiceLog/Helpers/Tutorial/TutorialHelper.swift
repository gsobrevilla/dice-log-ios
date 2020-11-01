//
//  TutorialHelper.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 01/11/2020.
//

import Foundation
import NotificationBannerSwift

class TutorialHelper {
    
    static func display(message: String, on viewController: UIViewController) {
//        let banner = FloatingNotificationBanner
        let banner = FloatingNotificationBanner(title: "title", subtitle: "sub", titleFont: nil, titleColor: nil, titleTextAlign: nil, subtitleFont: nil, subtitleColor: nil, subtitleTextAlign: nil, leftView: nil, rightView: nil, style: .info, colors: nil, iconPosition: .center)
//        banner.
        banner.show(bannerPosition: .top, on: viewController)
    }
}
