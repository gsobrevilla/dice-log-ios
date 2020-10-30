//
//  RollingPosibilitiesRepositoryProtocol.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

protocol DiceRollingRepositoryProtocol {
    
    typealias DiceRollingResultsCompletion = (_ success: Bool, _ results: [DiceRollingResult]?, _ error: String?) -> Void
    
    func getTwoDicesPossibleResults(completion: @escaping DiceRollingResultsCompletion)
}
