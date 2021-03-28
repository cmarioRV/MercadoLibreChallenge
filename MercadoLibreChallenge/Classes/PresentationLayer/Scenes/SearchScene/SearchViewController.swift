//
//  SearchViewController.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 27/03/21.
//

import Foundation
import UIKit

protocol SearchViewControllerProtocol: class {
    var onFinishWalktrough: (() -> Void)? { get set }
}

class SearchViewController: UIViewController, SearchViewControllerProtocol {
    
    // MARK: - Vars & Lets
    
    var onFinishWalktrough: (() -> Void)?
    var viewModel: SearchViewModelType?
    let cellId = "cellId"
    
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
        view.backgroundColor = .green
        setViews()
        bindViewModel()
    }
    
    // MARK: - Private methods
    
    private func setViews() {
        view.addSubview(tableView)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 40
        tableView.register(SearchViewCell.self, forCellReuseIdentifier: cellId)
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
        
        viewModel?.outputs.results.bind({ [weak self] (results) in
            guard let weakSelf = self else { return }
            DispatchQueue.main.async {
                if let results = results {
                    
                }
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
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! SearchViewCell
        cell.titleLabel.text = "sadfasdfasd"
        cell.priceLabel.text = "$344.444"
        cell.installmentLabel.text = "20 cuotas de 1000"
        cell.deliveryPriceLabel.text = "Envío gratis"
        cell.selectionStyle = .none
        
        return cell
    }
}
