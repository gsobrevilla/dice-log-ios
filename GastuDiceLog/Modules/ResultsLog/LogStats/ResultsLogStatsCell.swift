//
//  ResultsLogStatsCell.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 25/10/2020.
//

import Foundation
import UIKit

class ResultsLogStatsCell: UITableViewCell {
    
    private lazy var bar: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(bar)
        bar.frame = contentView.bounds
    }
}
