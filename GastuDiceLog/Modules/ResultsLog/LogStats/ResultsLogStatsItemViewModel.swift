//
//  ResultsLogStatsItemViewModel.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 01/11/2020.
//

import Foundation

struct ResultsLogStatsItemViewModel {

    let title: String
    
    let value: String
    
    /// Between 0 and 1
    let barLength: Float
    
    init(resultStats: DiceRollingResultStatistics, barLength: Float) {
        self.title = "\(resultStats.value)"
        self.value = "\(resultStats.times)"
        self.barLength = barLength
    }
    
    init(result: DiceRollingResult) {
        self.title = "\(result.value)"
        self.value = "-"
        self.barLength = 0
    }
}
