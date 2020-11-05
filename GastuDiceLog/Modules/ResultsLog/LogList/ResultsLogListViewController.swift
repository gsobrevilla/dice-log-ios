//
//  ResultsLogListViewController.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 24/10/2020.
//

import Foundation
import UIKit

protocol ResultsLogListPresenterProtocol: class {
    func fetchData()
}

class ResultsLogListViewController: UIViewController, InstantiableFromStoryboard {
    
    enum CellType {
        case header(String)
        case item(Int)
    }
    
    // InstantiableFromStoryboard
    static var appStoryboard: AppStoryboard = ResultsLogModule.storyboard
    
    // Outlets
    @IBOutlet private var tableView: UITableView?
    
    // Presenter
    var presenter: ResultsLogListPresenterProtocol?
    
    // Data
    private var cells: [CellType] = [] {
        didSet { tableView?.reloadData() }
    }
    var items: [ResultsLogListItemViewModel] = [] {
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
        var cells: [CellType] = []
        
        cells.append(.header("Last 10 results"))
        
        let last10 = items.prefix(10)
        cells.append(contentsOf: last10.enumerated().map({ CellType.item($0.offset) }))
        
        cells.append(.header("Previous results"))
        
        let rest = items.dropFirst(10)
        cells.append(contentsOf: rest.enumerated().map({ CellType.item($0.offset + 10) }))
        
        self.cells = cells
    }
}

extension ResultsLogListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cells[indexPath.row]

        
        switch cellType {
        case .header(let text):
            let cell = ResultsLogListHeaderCell()
            cell.setText(text)
            return cell
            
        case .item(let index):
            let cell = UITableViewCell()
            cell.textLabel?.text = items[index].text
            cell.textLabel?.font = .systemFont(ofSize: 20, weight: .medium)
            cell.textLabel?.textAlignment = .center
            return cell
        }
        
        
        
    }
}

extension ResultsLogListViewController: UITableViewDelegate {
    
}

extension ResultsLogListViewController: ResultsLogListViewProtocol {
    
    func showList(_ items: [ResultsLogListItemViewModel]) {
        self.items = items
    }
}
