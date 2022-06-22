//
//  FlashCardCell.swift
//  Cardify
//
//  Created by user218033 on 6/21/22.
//

import UIKit
import ComponentKit

class FlashCardCell: UITableViewCell {
    
    lazy var questionLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Term"
        return label
    }()
    
    lazy var questionTextField: BaseUITextField = {
       let tf = BaseUITextField()
        return tf
    }()
    
    lazy var answerLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Definition"
        return label
    }()
    
    lazy var answerTextField: BaseUITextField = {
       let tf = BaseUITextField()
        return tf
    }()
    
    lazy var hStack: HStack = {
        let stack = HStack()
        stack.addArrangedSubview(questionLabel)
        stack.addArrangedSubview(questionTextField)
        stack.addArrangedSubview(answerLabel)
        stack.addArrangedSubview(answerTextField)
        
        stack.spacing = 20
        stack.alignment = .center
        
        stack.isLayoutMarginsRelativeArrangement = true
        stack.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        return stack
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
        contentView.addSubview(hStack)
        NSLayoutConstraint.activate([
            hStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            hStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            hStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func updateView(question: String, answer: String) {
        questionTextField.text = question
        answerTextField.text = answer
    }
}
