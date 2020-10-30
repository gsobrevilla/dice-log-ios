//
//  NewRollEntryOptionViewModel.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

struct NewRollEntryOptionViewModel {
    let value: Int
    let text: String
    
    init(diceRollingResult: DiceRollingResult) {
        value = diceRollingResult.value
        text = "\(diceRollingResult.value)"
    }
}

