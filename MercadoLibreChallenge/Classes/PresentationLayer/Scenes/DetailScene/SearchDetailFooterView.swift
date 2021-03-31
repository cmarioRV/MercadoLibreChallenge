//
//  SearchDetailFooterView.swift
//  MercadoLibreChallenge
//
//  Created by Mario Rúa on 30/03/21.
//

import UIKit

class SearchDetailFooterView: UITableViewHeaderFooterView {
    let button: UIButton = {
        let btn = UIButton()
        btn.setTitle("add_to_cart".localized, for: .normal)
        btn.titleLabel?.font = FontBuilder().withFontType(type: .poppinsSemiBold).withSize(size: 15).build()
        return btn
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        configureContents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureContents() {
        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        
        let guides = contentView.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            button.widthAnchor.constraint(equalTo: guides.widthAnchor, multiplier: 0.5, constant: 0),
            button.heightAnchor.constraint(equalToConstant: 30),
            button.centerYAnchor.constraint(equalTo: guides.centerYAnchor),
            button.centerXAnchor.constraint(equalTo: guides.centerXAnchor)
        ])
        
        contentView.layoutIfNeeded()
    }
}
