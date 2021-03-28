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

    override func loadView() {
        view = UIView()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setViews()
        bindViewModel()
    }
    
    func setViews() {
       
    }
    
    func bindViewModel() {

    }
}
