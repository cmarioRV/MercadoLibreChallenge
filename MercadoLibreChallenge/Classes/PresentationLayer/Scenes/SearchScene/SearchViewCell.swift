//
//  SearchViewCell.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 28/03/21.
//

import Foundation
import UIKit

class SearchViewCell: UITableViewCell {
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
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
    
    fileprivate func configureContents() {
        
        contentView.addSubview(itemImageView)
        itemImageView.image = UIImage(named: "tempImage")
        itemImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            itemImageView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            itemImageView.widthAnchor.constraint(equalTo: itemImageView.heightAnchor, multiplier: 1, constant: 0),
            itemImageView.widthAnchor.constraint(equalTo: self.safeAreaLayoutGuide.widthAnchor, multiplier: 0.4),
            itemImageView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        contentView.addSubview(favImageView)
        favImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            favImageView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 30),
            favImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            favImageView.widthAnchor.constraint(equalTo: favImageView.heightAnchor, multiplier: 1, constant: 0),
            favImageView.widthAnchor.constraint(equalTo: widthAnchor, constant: 40)
        ])
        
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: itemImageView.trailingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: favImageView.leadingAnchor, constant: 20),
            stackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            stackView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor)
        ])
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(installmentLabel)
        stackView.addArrangedSubview(deliveryPriceLabel)
        
        layoutIfNeeded()
    }
}
