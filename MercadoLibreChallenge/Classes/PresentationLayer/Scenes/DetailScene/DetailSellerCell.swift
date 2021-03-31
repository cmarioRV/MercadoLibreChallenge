//
//  DetailFeaturesCell.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 30/03/21.
//

import Foundation
import UIKit
import Cosmos
import TinyConstraints

class DetailSellerCell: UITableViewCell, CellConfigurable {
    var viewModel: DetailSellerCellViewModel?
    
    let horizontalStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .equalSpacing
        return stack
    }()
    
    let verticalLeftStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        return stack
    }()
    
    let verticalRightStackView: UIStackView = {
        let stack = UIStackView()
        stack.alignment = .center
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        return stack
    }()
    
    let separatorView: UIView = {
       let v = UIView()
        v.backgroundColor = .lightGray
        return v
    }()
    
    let salesTitleLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = FontBuilder().withFontType(type: .poppinsRegular).withSize(size: 15).build()
        lbl.textAlignment = .left
        lbl.textColor = .black
        return lbl
    }()
    
    let salesValueLabel: UILabel = {
        let lbl = UILabel()
        lbl.numberOfLines = 0
        lbl.font = FontBuilder().withFontType(type: .poppinsRegular).withSize(size: 15).build()
        lbl.textAlignment = .left
        lbl.textColor = .black
        lbl.text = ""
        return lbl
    }()
    
    let ratingView: CosmosView = {
        let v = CosmosView()
        v.settings.filledImage = UIImage(named: "starFilled")?.withRenderingMode(.alwaysTemplate)
        v.tintColor = .orange
        v.settings.emptyImage = UIImage(named: "starEmpty")?.withRenderingMode(.alwaysTemplate)
        v.tintColor = .orange
        v.settings.totalStars = 5
        v.settings.starSize = 17
        v.settings.starMargin = 3.3
        v.settings.fillMode = .full
        v.settings.updateOnTouch = false
        
        v.text = "rate".localized
        v.settings.textColor = .black
        v.settings.textFont = FontBuilder().withFontType(type: .poppinsRegular).withSize(size: 15).build()
        v.settings.textMargin = 10
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(viewModel: CellViewModel) {
        guard let viewModel = viewModel as? DetailSellerCellViewModel else { return }
        self.viewModel = viewModel
        
        salesTitleLabel.text = viewModel.salesTitle
        salesValueLabel.text = String(viewModel.salesValue)
    }
    
    fileprivate func configureContents() {
        horizontalStackView.addArrangedSubview(verticalLeftStackView)
        horizontalStackView.addArrangedSubview(separatorView)
        horizontalStackView.addArrangedSubview(verticalRightStackView)
        
        verticalLeftStackView.addArrangedSubview(salesTitleLabel)
        verticalLeftStackView.addArrangedSubview(salesValueLabel)
        
        verticalRightStackView.addArrangedSubview(ratingView)
        
        contentView.addSubview(horizontalStackView)
        horizontalStackView.translatesAutoresizingMaskIntoConstraints = false
        
        let guides = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            horizontalStackView.leadingAnchor.constraint(equalTo: guides.leadingAnchor, constant: 30),
            horizontalStackView.topAnchor.constraint(equalTo: guides.topAnchor, constant: 20),
            horizontalStackView.centerYAnchor.constraint(equalTo: guides.centerYAnchor),
            horizontalStackView.centerXAnchor.constraint(equalTo: guides.centerXAnchor)
        ])
        
        contentView.layoutIfNeeded()
    }
}
