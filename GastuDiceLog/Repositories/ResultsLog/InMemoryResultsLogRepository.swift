//
//  InMemoryResultsLogRepository.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

class InMemoryResultsLogRepository: ResultsLogRepositoryProtocol {
    
    static var results: [DiceRollingResult] = []
    
    func store(result: DiceRollingResult, completion: @escaping SuccessCompletion) {
        Self.results.append(result)
        completion(true, nil)
    }
    
    func getResults(order: ResultsLogOrder, completion: @escaping ResultsCompletion) {
        var sortedResults = Self.results
        if order == .mostRecentFirst {
            sortedResults.reverse()
        }
        completion(true, sortedResults, nil)
    }
}
