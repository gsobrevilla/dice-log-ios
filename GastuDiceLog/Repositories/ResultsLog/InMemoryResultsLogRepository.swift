//
//  InMemoryResultsLogRepository.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

class InMemoryResultsLogRepository: ResultsLogRepositoryProtocol {
        
    private static var results: [DiceRollingResult] = []
    
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
    
    func getStatistics(compltion: @escaping ResultsStatsCompletion) {
        let resultsValues: [Int] = Self.results.map({ $0.value })
        let uniqueResultValues = Array(Set(resultsValues))
        let resultsWithStats = uniqueResultValues.map { (value) -> DiceRollingResultStatistics in
            let times = resultsValues.filter({ $0 == value }).count
            let item = DiceRollingResultStatistics(value: value, times: times)
            return item
        }
        compltion(true, resultsWithStats, nil)
    }
}
