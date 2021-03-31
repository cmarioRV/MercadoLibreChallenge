//
//  DetailImageCell.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 29/03/21.
//

import Foundation
import UIKit
import SDWebImage

class DetailImageCell: UITableViewCell, CellConfigurable {
    var viewModel: DetailImageCellViewModel?
    let itemImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: CellViewModel) {
        guard let viewModel = viewModel as? DetailImageCellViewModel else { return }
        self.viewModel = viewModel
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.itemImageView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: self.itemImageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.itemImageView.centerXAnchor)
        ])
        
        self.itemImageView.sd_setImage(with: URL(string: viewModel.imageURLString), placeholderImage: UIImage(named: ""), options: .scaleDownLargeImages) { (a, b, c, d) in
            activityIndicator.stopAnimating()
        }
    }
    
    fileprivate func configureContents() {
        contentView.addSubview(itemImageView)
        let guides = contentView.safeAreaLayoutGuide
        
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 30),
            itemImageView.centerXAnchor.constraint(equalTo: guides.centerXAnchor),
            itemImageView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 20),
            itemImageView.centerYAnchor.constraint(equalTo: guides.centerYAnchor),
            itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor, multiplier: 1, constant: 0)
        ])
        
        contentView.layoutIfNeeded()
    }
}
