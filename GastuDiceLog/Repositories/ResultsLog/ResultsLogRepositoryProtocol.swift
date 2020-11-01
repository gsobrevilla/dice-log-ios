//
//  ResultsLogRepositoryProtocol.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

enum ResultsLogOrder {
    case mostRecentFirst
    case mostRecentLast
}

protocol ResultsLogRepositoryProtocol {
    
    typealias SuccessCompletion = (_ success: Bool, _ error: String?) -> Void
    
    typealias ResultsCompletion = (_ success: Bool, _ results: [DiceRollingResult]?, _ error: String?) -> Void
    
    typealias ResultsStatsCompletion = (_ success: Bool, _ results: [DiceRollingResultStatistics]?, _ error: String?) -> Void
    
    func store(result: DiceRollingResult,completion: @escaping SuccessCompletion)
    
    func getResults(order: ResultsLogOrder, completion: @escaping ResultsCompletion)
    
    func getStatistics(compltion: @escaping ResultsStatsCompletion)
}
