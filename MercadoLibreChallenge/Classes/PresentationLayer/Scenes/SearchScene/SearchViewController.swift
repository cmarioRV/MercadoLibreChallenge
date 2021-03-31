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
    var onShowSearchDetail: ((Results) -> Void)? { get set }
}

class SearchViewController: UIViewController, SearchViewControllerProtocol {
    // MARK: - Vars & Lets
    
    var onShowSearchDetail: ((Results) -> Void)?
    var viewModel: SearchViewModelType!
    
    private let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)
    
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
        
        let guides = self.view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: guides.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: guides.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: guides.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: guides.bottomAnchor)
        ])
        
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "search_here".localized
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
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
        
        viewModel?.outputs.error.bind({ [weak self] (title, body) in
            guard let weakSelf = self else { return }
            DispatchQueue.main.async {
                weakSelf.showAlertWith(title: title, body: body)
            }
        })
    }
    
    // MARK: - Actions

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
        onShowSearchDetail?(viewModel.outputs.searchResults.value[indexPath.row])
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

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        viewModel.inputs.search(text: searchController.searchBar.text!)
    }
}
