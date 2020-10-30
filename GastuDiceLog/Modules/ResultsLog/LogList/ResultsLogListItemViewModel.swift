//
//  ResultsLogListItemViewModel.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

struct ResultsLogListItemViewModel {

    let text: String
    
    init(diceRollingResult: DiceRollingResult) {
        text = "\(diceRollingResult.value)"
    }
}

