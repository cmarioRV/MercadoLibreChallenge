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
    
    var onFinishWalktrough: (() -> Void)?
    var viewModel: SearchViewModelType?
    
    private let firstButton: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.addTarget(self, action: #selector(search), for: .touchUpInside)
        return button
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }()

    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        setViews()
        bindViewModel()
    }
    
    func setViews() {
        view.addSubview(firstButton)
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            firstButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            firstButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        view.layoutIfNeeded()
    }
    
    func bindViewModel() {

    }
    
    @objc fileprivate func search(_ sender: UIButton){
        viewModel?.inputs.search(text: "Motorola%20G6")
    }
}
