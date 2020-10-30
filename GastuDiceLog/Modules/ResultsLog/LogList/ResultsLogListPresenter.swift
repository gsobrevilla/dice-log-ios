//
//  ResultsLogListPresenter.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

protocol ResultsLogListViewProtocol: class {
    func showList(_ items: [ResultsLogListItemViewModel])
}

class ResultsLogListPresenter: ResultsLogListPresenterProtocol {
    
    private weak var view: ResultsLogListViewProtocol?
    private let repository: ResultsLogRepositoryProtocol
    
    init(view: ResultsLogListViewProtocol, repository: ResultsLogRepositoryProtocol) {
        self.view = view
        self.repository = repository
    }
    
    func fetchData() {
        repository.getResults(order: .mostRecentFirst) { [weak self] (success, results, error) in
            guard success, let results = results else {
                // TODO: handle error
                return
            }
            
            let items = results.map({ ResultsLogListItemViewModel(diceRollingResult: $0) })
            self?.view?.showList(items)
        }
    }
}
