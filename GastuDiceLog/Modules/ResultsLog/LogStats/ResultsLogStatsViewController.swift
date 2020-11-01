//
//  ResultsLogStatsViewController.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 25/10/2020.
//

import Foundation
import UIKit

protocol ResultsLogStatsPresenterProtocol: class {
    func fetchData()
}

class ResultsLogStatsViewController: UIViewController, InstantiableFromStoryboard {
    
    enum CellType {
        case header
        case item(Int)
    }
    
    // InstantiableFromStoryboard
    static var appStoryboard: AppStoryboard = ResultsLogModule.storyboard
    
    // Outlets
    @IBOutlet private var tableView: UITableView?
    
    // Presenter
    var presenter: ResultsLogStatsPresenterProtocol?
    
    // Data
    private var cells: [CellType] = [] {
        didSet { tableView?.reloadData() }
    }
    private var items: [ResultsLogStatsItemViewModel] = [] {
        didSet { updateCells() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.fetchData()
    }
    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.tableFooterView = UIView()
        tableView?.separatorColor = .white
    }
    
    private func updateCells() {
        var cells: [CellType] = [.header]
        cells.append(contentsOf: items.enumerated().map({ CellType.item($0.offset) }))
        self.cells = cells
    }
}

extension ResultsLogStatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cells[indexPath.row]
        
        switch cellType {
        case .header:
            let cell = ResultsLogStatsHeaderCell()
            return cell
            
        case .item(let index):
            let cell = ResultsLogStatsItemCell()
            cell.viewModel = items[index]
            return cell
        }
    }
}

extension ResultsLogStatsViewController: UITableViewDelegate {
    
}

extension ResultsLogStatsViewController: ResultsLogStatsViewProtocol {
    
    func showList(_ items: [ResultsLogStatsItemViewModel]) {
        self.items = items
    }
}
