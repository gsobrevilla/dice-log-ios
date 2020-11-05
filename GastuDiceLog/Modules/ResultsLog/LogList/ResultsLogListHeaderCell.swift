//
//  ResultsLogListHeaderCell.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 01/11/2020.
//

import Foundation
import UIKit

class ResultsLogListHeaderCell: UITableViewCell {
    
    init() {
        super.init(style: .value1, reuseIdentifier: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setText(_ text: String) {
        textLabel?.text = text
    }
}
