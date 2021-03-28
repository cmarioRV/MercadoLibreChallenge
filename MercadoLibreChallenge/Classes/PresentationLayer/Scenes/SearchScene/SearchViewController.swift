//
//  SearchViewController.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation
import UIKit
import SDWebImage

protocol SearchViewControllerProtocol: class {
    var onFinishWalktrough: (() -> Void)? { get set }
}

class SearchViewController: UIViewController, SearchViewControllerProtocol {
    
    // MARK: - Vars & Lets
    
    var onFinishWalktrough: (() -> Void)?
    var viewModel: SearchViewModelType!
    
    private let tableView = UITableView()
    
    private let contentView: UIView = {
        let view = UIView()
        return view
    }()

    // MARK: - Controller lifecycle
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.inputs.search(text: "Motorola%20G6")
    }
    
    // MARK: - Private methods
    
    private func setViews() {
        view.addSubview(tableView)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.showsVerticalScrollIndicator = false
        tableView.register(SearchViewCell.self, forCellReuseIdentifier: SearchViewCell.cellIdentifier())
        tableView.delegate = self
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.layoutIfNeeded()
    }
    
    private func bindViewModel() {
        viewModel?.outputs.isBussy.bind({ [weak self] (isBussy) in
            guard let weakSelf = self else { return }
            DispatchQueue.main.async {
                if isBussy {
                    weakSelf.showSpinner()
                } else {
                    weakSelf.removeSpinner()
                }
            }
        })
        
        viewModel?.outputs.cellViewModels.bind({ [weak self] (results) in
            guard let weakSelf = self else { return }
            DispatchQueue.main.async {
                weakSelf.tableView.reloadData()
            }
        })
    }
    
    // MARK: - Actions
//    signUpButton.addTarget(self, action: #selector(signUpTapped), for: .touchUpInside)
    @objc fileprivate func actionSearch(_ sender: UIButton){
        viewModel?.inputs.search(text: "Motorola%20G6")
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.cellViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let rowViewModel = viewModel.outputs.cellViewModels.value[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier(for: rowViewModel), for: indexPath)

        if let cell = cell as? CellConfigurable {
            cell.setup(viewModel: rowViewModel)
        }
        
        cell.selectionStyle = .none
        cell.layoutIfNeeded()
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        delegate?.cellSelected(name: viewModel.outputs.cellViewModels.value[indexPath.row].name)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func cellIdentifier(for viewModel: CellViewModel) -> String {
        switch viewModel {
        case is SearchViewCellViewModel:
            return SearchViewCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}
