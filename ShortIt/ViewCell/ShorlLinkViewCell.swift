//
//  ShorlLinkViewCell.swift
//  ShortIt
//
//  Created by Александр on 15/01/2022.
//

import UIKit

class ShorlLinkViewCell: UITableViewCell {
    
    let shortLinkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = .boldSystemFont(ofSize: 16)
        button.setTitleColor(.black, for: .normal)
        button.addTarget(self, action: #selector(showInformation), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(shortLinkButton)
        setTitleLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setTitleLabelConstraints() {
        NSLayoutConstraint.activate([
            shortLinkButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            shortLinkButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            shortLinkButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
    
    @objc private func showInformation() {
        
    }
    
//    func configure(with title: String) {
//        shortLinkButton.setTitle(title, for: .normal)
//    }
    
    func configure(with title: Responce) {
        let urlTitle = StorageManager.shared.showUrl(forkey: title.longUrl)
        shortLinkButton.setTitle(urlTitle, for: .normal)
    }
}
