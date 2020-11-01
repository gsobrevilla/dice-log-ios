//
//  NewRollEntryViewController.swift
//  GastuDiceLog
//
//  Created by Gastón Sobrevilla on 23/10/2020.
//

import Foundation
import UIKit

protocol NewRollEntryPresenterProtocol: class {
    func optionSelected(_ option: NewRollEntryOptionViewModel, at index: Int)
}

class NewRollEntryViewController: UIViewController, InstantiableFromStoryboard {
    
    // InstantiableFromStoryboard
    static var appStoryboard: AppStoryboard = NewRollEntryModule.storyboard
    
    // Outlets
    @IBOutlet private var collectionView: UICollectionView?
    
    // Configurations
    private var spacing: CGFloat = 12
    
    // Data
    var options: [NewRollEntryOptionViewModel] = [] {
        didSet { collectionView?.reloadData() }
    }
    
    // Presenter
    var presenter: NewRollEntryPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        TutorialHelper.display(message: "", on: self)
    }
    
    private func setupCollectionView() {
        collectionView?.register(NewRollEntryCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView?.dataSource = self
        collectionView?.delegate = self
    }
}

extension NewRollEntryViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard indexPath.row < options.count else { return UICollectionViewCell() }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? NewRollEntryCell else { return UICollectionViewCell() }
        cell.viewModel = options[indexPath.row]
        return cell
    }
}

extension NewRollEntryViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = floor((collectionView.bounds.width - spacing * 4) / 3)
        let height = floor((collectionView.bounds.height - spacing * 5) / 4)
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard indexPath.row < options.count else { return }
        let option = options[indexPath.row]
        presenter?.optionSelected(option, at: indexPath.row)
        (collectionView.cellForItem(at: indexPath) as? NewRollEntryCell)?.showSuccess()
    }
}

extension NewRollEntryViewController: NewRollEntryViewProtocol {
    
    func setOptions(_ options: [NewRollEntryOptionViewModel]) {
        self.options = options
    }
}
