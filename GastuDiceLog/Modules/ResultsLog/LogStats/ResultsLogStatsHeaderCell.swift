//
//  ResultsLogStatsHeaderCell.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 01/11/2020.
//

import Foundation
import UIKit

class ResultsLogStatsHeaderCell: UITableViewCell {
    
    init() {
        super.init(style: .value1, reuseIdentifier: nil)
        textLabel?.text = "Result"
        detailTextLabel?.text = "Times"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
}
