//
//  CriteriaView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 20/01/23.
//

import Foundation

import UIKit

class CriteriaView: UIView {
    
    lazy var stackView = UIStackView()
    lazy var singleCriteriaView1 = SingleCriteriaView()
    lazy var singleCriteriaView2 = SingleCriteriaView()
    lazy var singleCriteriaView3 = SingleCriteriaView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        setupSelfView()
        setupComponentViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Required - implement init(coder: - class LoginView)")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 500)
    }
    
    //MARK: - View Setup
    private func setupSelfView() {
        self.addSubview(stackView)
        stackView.addArrangedSubview(singleCriteriaView1)
        stackView.addArrangedSubview(singleCriteriaView2)
        stackView.addArrangedSubview(singleCriteriaView3)
        
        translatesAutoresizingMaskIntoConstraints = false
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
    }
    
    private func setupComponentViews() {
        setupStackView()
    }
    
    private func setupStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
}


class SingleCriteriaView: UIView {
   
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .fill
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
   
    private func setupView() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(textLabel)
        
        self.subviews.forEach { $0.translatesAutoresizingMaskIntoConstraints = false }
        
//        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
//        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
//        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
//        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16).isActive = true
    }
}


