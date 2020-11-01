//
//  NewRollEntryCell.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 23/10/2020.
//

import Foundation
import UIKit

class NewRollEntryCell: UICollectionViewCell {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = ""
        label.font = .systemFont(ofSize: 45, weight: .regular)
        return label
    }()
    
    private lazy var square: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.darkGray.cgColor
        view.layer.cornerRadius = 20
        return view
    }()
    
    private let checkmarkDuration: Double = 0.3
    
    private lazy var checkmark: WVCheckMark = {
        let view = WVCheckMark()
        view.setDuration(speed: CGFloat(checkmarkDuration))
        view.backgroundColor = .white
        view.alpha = 0
        view.setColor(color: UIColor.defaultTintColor.cgColor)
        view.setLineWidth(width: 3)
        return view
    }()

    var viewModel: NewRollEntryOptionViewModel? {
        didSet { updateFromViewModel() }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Cell background
        contentView.backgroundColor = .white
        
        // Square
        contentView.addSubview(square)
        let contentWidth = contentView.bounds.width
        let contentHeight = contentView.bounds.height
        if contentHeight > contentWidth {
            let side = contentWidth
            let x: CGFloat = 0.0
            let y = (contentHeight - side) / 2
            square.frame = CGRect(x: x, y: y, width: side, height: side)
        } else {
            let side = contentHeight
            let x = (contentWidth - side) / 2
            let y: CGFloat = 0.0
            square.frame = CGRect(x: x, y: y, width: side, height: side)
        }
        
        // Label
        contentView.addSubview(label)
        label.frame = contentView.bounds
        
        // Checkmark
        contentView.addSubview(checkmark)
        checkmark.frame = CGRect(x: square.frame.minX + 20, y: square.frame.minY + 20, width: square.frame.width - 40, height: square.frame.height - 40)
    }
    
    func showSuccess() {
        self.checkmark.alpha = 1
        self.checkmark.start {
            UIView.animate(withDuration: self.checkmarkDuration * 2) {
                self.checkmark.alpha = 0
            }
        }
    }
    
    private func updateFromViewModel() {
        label.text = viewModel?.text
    }
}
