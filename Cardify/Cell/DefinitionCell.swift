//
//  DefinitionCell.swift
//  Cardify
//
//  Created by user218033 on 7/9/22.
//

import UIKit
import ComponentKit

class DefinitionCell: UITableViewCell {
    
    lazy var definitionLabel: BaseUILabel = {
       let label = BaseUILabel()
        label.textColor = UIColor(hexString: "#5D1049")
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    func setupView() {
        contentView.addSubview(definitionLabel)
        NSLayoutConstraint.activate([
            definitionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            definitionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            definitionLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            definitionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func updateView(definition: String) {
        definitionLabel.text = definition
    }
}
