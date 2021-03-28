//
//  SearchViewCell.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation
import UIKit
import SDWebImage

class SearchViewCell: UITableViewCell, CellConfigurable {
    
    var viewModel: SearchViewCellViewModel?
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        return stack
    }()
    
    let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = FontBuilder().withFontType(type: .titleBold).withSize(size: 28).build()
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = FontBuilder().withFontType(type: .poppinsMedium).withSize(size: 28).build()
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    let installmentLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = FontBuilder().withFontType(type: .poppinsMedium).withSize(size: 28).build()
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    let deliveryPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = FontBuilder().withFontType(type: .poppinsMedium).withSize(size: 28).build()
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    let favImageView = UIImageView()
    let itemImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    func setup(viewModel: CellViewModel) {
        guard let viewModel = viewModel as? SearchViewCellViewModel else { return }
        self.viewModel = viewModel
        self.titleLabel.text = viewModel.title
        self.priceLabel.text = viewModel.price
        self.installmentLabel.text = viewModel.installment
        self.deliveryPriceLabel.text = viewModel.deliveryPrice
        self.favImageView.image = UIImage(named: viewModel.favImageName)
        self.itemImageView.image = UIImage(named: viewModel.itemImageName)
        
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.startAnimating()
        self.itemImageView.addSubview(activityIndicator)
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            activityIndicator.centerYAnchor.constraint(equalTo: self.itemImageView.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: self.itemImageView.centerXAnchor)
        ])
        
        self.itemImageView.sd_setImage(with: URL(string: viewModel.thumbnail), placeholderImage: UIImage(named: ""), options: .scaleDownLargeImages) { (a, b, c, d) in
            activityIndicator.stopAnimating()
        }
    }
    
    fileprivate func configureContents() {
        
        contentView.addSubview(itemImageView)
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let guides = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 30),
            itemImageView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 30),
            itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor, multiplier: 1, constant: 0),
            itemImageView.widthAnchor.constraint(equalTo: guides.widthAnchor, multiplier: 0.2),
            itemImageView.centerYAnchor.constraint(equalTo: guides.centerYAnchor)
        ])
        
        contentView.addSubview(favImageView)
        favImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favImageView.trailingAnchor.constraint(equalTo: guides.trailingAnchor, constant: -30),
            favImageView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 30),
            favImageView.widthAnchor.constraint(equalTo: favImageView.heightAnchor, multiplier: 1, constant: 0),
            favImageView.widthAnchor.constraint(equalToConstant: 20)
        ])
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: favImageView.leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 30),
            stackView.centerYAnchor.constraint(equalTo: guides.centerYAnchor)
        ])
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(installmentLabel)
        stackView.addArrangedSubview(deliveryPriceLabel)
        
        contentView.layoutIfNeeded()
    }
}
