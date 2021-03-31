//
//  PriceCell.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 30/03/21.
//

import Foundation
import UIKit

class DetailPriceCell: UITableViewCell, CellConfigurable {
    var viewModel: DetailPriceCellViewModel?
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .fill
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        return stack
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = FontBuilder().withFontType(type: .poppinsRegular).withSize(size: 15).build()
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    let installmentsLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = FontBuilder().withFontType(type: .poppinsRegular).withSize(size: 15).build()
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: CellViewModel) {
        guard let viewModel = viewModel as? DetailPriceCellViewModel else { return }
        self.viewModel = viewModel
        
        priceLabel.text = viewModel.price
        installmentsLabel.text = viewModel.installments
    }
    
    fileprivate func configureContents() {
        stackView.addArrangedSubview(priceLabel)
        stackView.addArrangedSubview(installmentsLabel)
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let guides = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 30),
            stackView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 20),
            stackView.centerYAnchor.constraint(equalTo: guides.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: guides.centerXAnchor)
        ])
        
        contentView.layoutIfNeeded()
    }
}
