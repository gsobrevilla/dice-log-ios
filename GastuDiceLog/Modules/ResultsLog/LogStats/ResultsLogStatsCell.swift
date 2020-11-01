//
//  ResultsLogStatsCell.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 25/10/2020.
//

import Foundation
import UIKit

class ResultsLogStatsItemCell: UITableViewCell {
    
    private lazy var bar: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.defaultTintColor.withAlphaComponent(0.5)
        return view
    }()
    
    var viewModel: ResultsLogStatsItemViewModel? {
        didSet { updateFromViewModel() }
    }
    
    init() {
        super.init(style: .value1, reuseIdentifier: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.addSubview(bar)
        contentView.sendSubviewToBack(bar)
    }
    
    private func updateFromViewModel() {
        textLabel?.text = viewModel?.title
        detailTextLabel?.text = viewModel?.value
        bar.frame = contentView.bounds
            .addingPadding(.regular(8))
            .multiplyingWidth(by: CGFloat(viewModel?.barLength ?? 0))
    }
}
