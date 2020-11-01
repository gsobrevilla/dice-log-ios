//
//  DiceRollingResultStatistics.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 01/11/2020.
//

import Foundation

class DiceRollingResultStatistics {
    
    var value: Int = 0
    var times: Int = 0
    
    init(value: Int, times: Int) {
        self.value = value
        self.times = times
    }
}
