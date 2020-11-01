//
//  ResultsLogRouter.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

class ResultsLogRouter {
    
    private static var resultsLogRepository: ResultsLogRepositoryProtocol {
        return InMemoryResultsLogRepository()
    }
    
    private static var rollingRepository: DiceRollingRepositoryProtocol {
        return InMemoryDiceRollingRepository()
    }
    
    static func instantiateListVC() -> ResultsLogListViewController {
        let vc = ResultsLogListViewController.instantiateFromStoryboard()
        let presenter = ResultsLogListPresenter(view: vc, repository: resultsLogRepository)
        vc.presenter = presenter
        return vc
    }
    
    static func instantiateStatsVC() -> ResultsLogStatsViewController {
        let vc = ResultsLogStatsViewController.instantiateFromStoryboard()
        let presenter = ResultsLogStatsPresenter(view: vc, resultsRepository: resultsLogRepository, rollingRepository: rollingRepository)
        vc.presenter = presenter
        return vc
    }
}
