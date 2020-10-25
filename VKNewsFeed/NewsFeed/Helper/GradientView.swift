//
//  Gradient.swift
//  VKNewsFeed
//
//  Created by Анастасия Кудашева on 24.10.2020.
//  Copyright © 2020 Анастасия Кудашева. All rights reserved.
//

import Foundation
import UIKit

class GradientView: UIView {
    private let gadientLayer = CAGradientLayer()
    
    @IBInspectable private var startColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    @IBInspectable private var endColor: UIColor? {
        didSet {
            setupGradientColors()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGradient()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gadientLayer.frame = bounds
    }
    
    private func setupGradient() {
        self.layer.addSublayer(gadientLayer)
        setupGradientColors()
        
        gadientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gadientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
    }
    
    private func setupGradientColors() {
        if let startColor = startColor, let endColor = endColor {
            gadientLayer.colors = [startColor.cgColor, endColor.cgColor]
        }
    }
    
}
