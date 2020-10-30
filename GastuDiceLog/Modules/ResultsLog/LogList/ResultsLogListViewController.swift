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
    
    // InstantiableFromStoryboard
    static var appStoryboard: AppStoryboard = ResultsLogModule.storyboard
    
    // Outlets
    @IBOutlet private var tableView: UITableView?
    
    // Presenter
    var presenter: ResultsLogListPresenterProtocol?
    
    // Data
    var items: [ResultsLogListItemViewModel] = [] {
        didSet { tableView?.reloadData() }
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
    }
}

extension ResultsLogListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = items[indexPath.row].text
        return cell
    }
}

extension ResultsLogListViewController: UITableViewDelegate {
    
}

extension ResultsLogListViewController: ResultsLogListViewProtocol {
    
    func showList(_ items: [ResultsLogListItemViewModel]) {
        self.items = items
    }
}
