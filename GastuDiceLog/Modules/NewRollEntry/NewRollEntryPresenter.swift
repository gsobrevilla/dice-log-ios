//
//  NewRollEntryPresenter.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation

protocol NewRollEntryViewProtocol: class {
    func setOptions(_ options: [NewRollEntryOptionViewModel])
}

class NewRollEntryPresenter: NewRollEntryPresenterProtocol {
    
    private weak var view: NewRollEntryViewProtocol?
    private let rollingRepository: DiceRollingRepositoryProtocol
    private let resultsRepository: ResultsLogRepositoryProtocol
    
    init(view: NewRollEntryViewProtocol, rollingRepository: DiceRollingRepositoryProtocol, resultsRepository: ResultsLogRepositoryProtocol) {
        self.view = view
        self.rollingRepository = rollingRepository
        self.resultsRepository = resultsRepository
        setupOptions()
    }
    
    private func setupOptions() {
        rollingRepository.getTwoDicesPossibleResults { [weak self] (success, results, error) in
            guard success, let results = results else {
                // TODO: handle error
                return
            }
            
            let options  = results.map({ NewRollEntryOptionViewModel(diceRollingResult: $0) })
            self?.view?.setOptions(options)
        }
    }
    
    func optionSelected(_ option: NewRollEntryOptionViewModel, at index: Int) {
        let result = DiceRollingResult(value: option.value)
        resultsRepository.store(result: result) { (success, error) in
            guard success else {
                // TODO: handle error
                return
            }
        }
    }
}

