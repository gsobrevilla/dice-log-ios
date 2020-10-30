//
//  ResultsLogRouter.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

class ResultsLogRouter {
    
    static func instantiateResultsLogListViewController() -> ResultsLogListViewController {
        let vc = ResultsLogListViewController.instantiateFromStoryboard()
        let repository = InMemoryResultsLogRepository()
        let presenter = ResultsLogListPresenter(view: vc, repository: repository)
        vc.presenter = presenter
        return vc
    }
}
