//
//  ResultsLogStatsViewController.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 25/10/2020.
//

import Foundation
import UIKit

class ResultsLogStatsViewController: UIViewController, InstantiableFromStoryboard {
    
    // InstantiableFromStoryboard
    static var appStoryboard: AppStoryboard = ResultsLogModule.storyboard
    
    // Outlets
    @IBOutlet private var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
//        presenter?.fetchData()
    }
    
    private func setupTableView() {
        tableView?.dataSource = self
        tableView?.delegate = self
        tableView?.tableFooterView = UIView()
    }
}

extension ResultsLogStatsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ResultsLogStatsCell()
//        cell.textLabel?.text = items[indexPath.row].text
        return cell
    }
}

extension ResultsLogStatsViewController: UITableViewDelegate {
    
}
