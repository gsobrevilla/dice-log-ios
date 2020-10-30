//
//  NewRollEntryRouter.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation
import UIKit

class NewRollEntryRouter {
    
    static func instantiateNewRollEntryViewController() -> NewRollEntryViewController {
        let vc = NewRollEntryViewController.instantiateFromStoryboard()
        let presenter = NewRollEntryPresenter(view: vc, rollingRepository: InMemoryDiceRollingRepository(), resultsRepository: InMemoryResultsLogRepository())
        vc.presenter = presenter
        return vc
    }
}
