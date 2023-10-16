//
//  SelectedBarShapView.swift
//  LittlePink
//
//  Created by 赵蔚 on 2023/10/13.
//

import UIKit

class SelectedBarShapView: UIView {


    
    override func draw(_ rect: CGRect) {
        
        let shapLayer = CAShapeLayer()
        shapLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: 2).cgPath
        shapLayer.fillColor = UIColor(named: "main")?.cgColor
        layer.addSublayer(shapLayer)

    }
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
