//
//  SingleCriteriaView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 21/01/23.
//

import UIKit

class SingleCriteriaView: UIView {
   
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.spacing = 10
        stack.backgroundColor = .cyan
        return stack
    }()
   
    let imageView: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage(systemName: "circle")
        imgView.contentMode = .scaleAspectFit
        return imgView
    }()
   
    let textLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "O que será que será?"
        return label
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
   
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 40)
    }
   
    private func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }

    }
}


