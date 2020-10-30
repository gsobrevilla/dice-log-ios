//
//  InMemoryDiceRollingRepository.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

class InMemoryDiceRollingRepository: DiceRollingRepositoryProtocol {
    
    func getTwoDicesPossibleResults(completion: @escaping DiceRollingResultsCompletion) {
        let options = (2...12).map { (value) -> DiceRollingResult in
            return DiceRollingResult(value: value)
        }
        completion(true, options, nil)
    }
}
