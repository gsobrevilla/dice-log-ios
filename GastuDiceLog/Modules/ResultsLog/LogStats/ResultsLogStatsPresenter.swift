//
//  ResultsLogStatsPresenter.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 01/11/2020.
//

import Foundation

protocol ResultsLogStatsViewProtocol: class {
    func showList(_ items: [ResultsLogStatsItemViewModel])
}

class ResultsLogStatsPresenter: ResultsLogStatsPresenterProtocol {
    
    private weak var view: ResultsLogStatsViewProtocol?
    private let resultsRepository: ResultsLogRepositoryProtocol
    private let rollingRepository: DiceRollingRepositoryProtocol
    
    init(view: ResultsLogStatsViewProtocol, resultsRepository: ResultsLogRepositoryProtocol, rollingRepository: DiceRollingRepositoryProtocol) {
        self.view = view
        self.resultsRepository = resultsRepository
        self.rollingRepository = rollingRepository
    }
    
    func fetchData() {
        resultsRepository.getStatistics { [weak self] (success, results, error) in
            guard success, let results = results else {
                // TODO: handle error
                return
            }
            
            self?.updateResults(results)
        }
    }
    
    private func updateResults(_ resultsHistory: [DiceRollingResultStatistics]) {
        rollingRepository.getTwoDicesPossibleResults { [weak self] (success, possibleResults, error) in
            guard success, let possibleResults = possibleResults else {
                // TODO: handle error
                return
            }
            
            // TODO: move this processing to other method
            let resultWithGreatestTimes = resultsHistory.max { (stats1, stats2) -> Bool in
                return stats1.times < stats2.times
            }
            let greatestNumberOfTimes: Float = Float(resultWithGreatestTimes?.times ?? 1)
            
            let items = possibleResults.map { (possibleResult) -> ResultsLogStatsItemViewModel in
                
                if let result = resultsHistory.first(where: { $0.value == possibleResult.value }) {
                    // The value came out previously
                    let percentageOverGreatest: Float = Float(result.times) / greatestNumberOfTimes
                    return ResultsLogStatsItemViewModel(
                        resultStats: result,
                        barLength: percentageOverGreatest)
                } else {
                    // The values has neves came out
                    return ResultsLogStatsItemViewModel(result: possibleResult)
                }
                
            }
            
            self?.view?.showList(items)
        }
    }
}
