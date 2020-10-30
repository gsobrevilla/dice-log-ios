//
//  AppStoryboard.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

struct AppStoryboard {
    
    private let name: String
    
    init(name: String) {
        self.name = name
    }
    
    var storyboardName: String {
        return name
    }
}
