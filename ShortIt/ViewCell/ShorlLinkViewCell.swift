//
//  ShorlLinkViewCell.swift
//  ShortIt
//
//  Created by Александр on 15/01/2022.
//

import UIKit

class ShorlLinkViewCell: UITableViewCell {
    
    let shortLinkButton: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        return label
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
    
    func configure(with title: Responce) {
        shortLinkButton.text = title.shortUrl
    }
}
