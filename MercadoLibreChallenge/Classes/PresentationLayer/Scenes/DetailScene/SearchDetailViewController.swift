//
//  SearchDetailViewController.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation
import UIKit

class SearchDetailViewController: UIViewController {
    var viewModel: SearchDetailViewModelType!
    var result: Results?

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
        
        guard let result = result else { return }
        viewModel.inputs.loadResult(result: result)
    }
    
    private func setViews() {
        view.addSubview(tableView)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 200
        tableView.showsVerticalScrollIndicator = false
        tableView.register(DetailImageCell.self, forCellReuseIdentifier: DetailImageCell.cellIdentifier())
        tableView.register(DetailPriceCell.self, forCellReuseIdentifier: DetailPriceCell.cellIdentifier())
        tableView.register(DetailSellerCell.self, forCellReuseIdentifier: DetailSellerCell.cellIdentifier())
        tableView.register(SearchDetailFooterView.self, forHeaderFooterViewReuseIdentifier: "tableViewFooter")
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
}

extension SearchDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.outputs.cellViewModels.value.count
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return section == 1 ? 70 : 0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "tableViewFooter") as! SearchDetailFooterView
        return view
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
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func cellIdentifier(for viewModel: CellViewModel) -> String {
        switch viewModel {
        case is DetailImageCellViewModel:
            return DetailImageCell.cellIdentifier()
        case is DetailPriceCellViewModel:
            return DetailPriceCell.cellIdentifier()
        case is DetailSellerCellViewModel:
            return DetailSellerCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}
