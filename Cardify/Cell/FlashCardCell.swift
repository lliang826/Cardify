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
        label.textColor = UIColor(hexString: "#5D1049")
        return label
    }()
    
    lazy var questionTextField: BaseUITextField = {
       let tf = BaseUITextField()
        tf.borderStyle = .line
        tf.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return tf
    }()
    
    lazy var answerLabel: BaseUILabel = {
        let label = BaseUILabel()
        label.text = "Definition"
        label.textColor = UIColor(hexString: "#5D1049")
        return label
    }()
    
    lazy var answerTextField: BaseUITextField = {
       let tf = BaseUITextField()
        tf.borderStyle = .line
        tf.font = UIFont.preferredFont(forTextStyle: .subheadline)
        return tf
    }()
    
    lazy var vStack: VStack = {
        let stack = VStack()
        stack.addArrangedSubview(questionLabel)
        stack.addArrangedSubview(questionTextField)
        stack.addArrangedSubview(answerLabel)
        stack.addArrangedSubview(answerTextField)
        
        stack.spacing = 10
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
        contentView.addSubview(vStack)
        NSLayoutConstraint.activate([
            vStack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            vStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            vStack.topAnchor.constraint(equalTo: contentView.topAnchor),
            vStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func updateView(question: String, answer: String) {
        questionTextField.text = question
        answerTextField.text = answer
    }
}
