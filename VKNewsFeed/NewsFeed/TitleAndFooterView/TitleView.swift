//
//  TitleView.swift
//  VKNewsFeed
//
//  Created by Анастасия Кудашева on 21.10.2020.
//  Copyright © 2020 Анастасия Кудашева. All rights reserved.
//

import Foundation
import UIKit

protocol TitleViewViewModel {
    var photoUrlString: String? { get }
    var nameString: String { get }
}

class TitleView: UIView {
    
    var myNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.lineBreakMode = .byClipping
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.0001590510899, green: 0.02314645317, blue: 0.0972596764, alpha: 1)
        return label
    }()
    
    private var myAvatarView: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .orange
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(myNameLabel)
        addSubview(myAvatarView)
        makeConstraints()
    }
    
    func set(userViewModel: TitleViewViewModel) {
        myAvatarView.set(imageURL: userViewModel.photoUrlString)
        myNameLabel.text = userViewModel.nameString
    }
    
    private func makeConstraints() {
        myAvatarView.anchor(top: topAnchor,
                            leading: leadingAnchor,
                            bottom: nil,
                            trailing: nil,
                            padding: UIEdgeInsets.init(top: 4, left: 4, bottom: 777, right: 777))
        myAvatarView.heightAnchor.constraint(equalTo: myNameLabel.heightAnchor, multiplier: 1).isActive = true
        myAvatarView.widthAnchor.constraint(equalTo: myNameLabel.heightAnchor, multiplier: 1).isActive = true
        
        myNameLabel.anchor(top: topAnchor,
                           leading: myAvatarView.trailingAnchor,
                           bottom: bottomAnchor,
                           trailing: trailingAnchor,
                           padding: UIEdgeInsets.init(top: 4, left: 12, bottom: 4, right: 4))
    }
    
    override var intrinsicContentSize: CGSize {
        return UIView.layoutFittingExpandedSize
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        myAvatarView.layer.masksToBounds = true
        myAvatarView.layer.cornerRadius = myAvatarView.frame.width / 2
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
