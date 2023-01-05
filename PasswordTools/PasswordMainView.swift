//
//  PasswordMainView.swift
//  PasswordTools
//
//  Created by Beltrami Dias Batista, Thiago on 04/01/23.
//

import UIKit

class PasswordMainView: UIView {
    
    lazy var lockImageView = UIImageView(image: UIImage(systemName: "lock.fill"))

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: 200, height: 200)
    }

    //MARK: - Setup Views
    private func setupViews(){
        self.setupSelfView()
        self.setupLockImageView()
        self.setupMainLabel()
        self.setupFirstInputText()
    }
    
    func setupSelfView() {
        self.addSubview(lockImageView)
        self.backgroundColor = .green
        self.subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func setupLockImageView() {
        NSLayoutConstraint.activate([
            lockImageView.topAnchor.constraint(equalTo: topAnchor),
            lockImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    func setupMainLabel() {
        
    }
    func setupFirstInputText() {
        
    }
}
