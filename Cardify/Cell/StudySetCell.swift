//
//  StudySetCell.swift
//  Cardify
//
//  Created by user218033 on 6/19/22.
//

import UIKit
import ComponentKit

class StudySetCell: UITableViewCell {
    
    lazy var titleLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var rightArrow: BaseUIButton = {
       let button = BaseUIButton()
        button.setImage(UIImage(named: "rightArrow"), for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        return button
    }()
    
    lazy var HStack: HStack = {
        let stackView = ComponentKit.HStack()
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(rightArrow)
        stackView.alignment = .center
        
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return stackView
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
        contentView.addSubview(HStack)
        NSLayoutConstraint.activate([
            HStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            HStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            HStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            HStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func updateView(title: String) {
        titleLabel.text = title
    }
}
