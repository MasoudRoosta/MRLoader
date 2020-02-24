//
//  spiner.swift
//  Zehn
//
//  Created by Masoud Roosta on 8/14/19.
//  Copyright © 2019 Elixeir. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class MRLoaderView : UIView {
 
    
    let circleLayer = CAShapeLayer()
    let innerCircle = CAShapeLayer()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    @IBInspectable var lineWidth: CGFloat = 4 {
        didSet {
            circleLayer.lineWidth = lineWidth
            innerCircle.lineWidth = lineWidth
            setNeedsLayout()
        }
    }
    @IBInspectable var animating: Bool = true {
        didSet {
            updateAnimation()
        }
    }
    @IBInspectable var doubleSpiner: Bool = true {
        didSet {
            updateAnimation()
        }
    }
    
    @IBInspectable var SameRotation: Bool = true {
        didSet {
            updateAnimation()
        }
    }
    let mas = (.pi * 2.0)
    let rotationAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = (.pi * 2.0)
        animation.duration = 4
        animation.repeatCount = MAXFLOAT
        return animation
    }()
    let rotationAnimation2: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "transform.rotation.z")
        animation.fromValue = 0
        animation.toValue = (.pi * -2.0)
        animation.duration = 4
        animation.repeatCount = MAXFLOAT
        return animation
    }()
    
    func updateAnimation() {
        if animating {
            if doubleSpiner {
                if SameRotation{
                    circleLayer.add(rotationAnimation, forKey: "rotation")
                    innerCircle.add(rotationAnimation, forKey: "rotation")
                }else{
                    circleLayer.add(rotationAnimation, forKey: "rotation")
                    innerCircle.add(rotationAnimation2, forKey: "rotation")
                }
                
            }else{
                circleLayer.add(rotationAnimation, forKey: "rotation")
            }
        }
        else {

            circleLayer.removeAnimation(forKey: "rotation")
            innerCircle.removeAnimation(forKey: "rotation")
            
        }
    }
    
    let strokeEndAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }()
    
    let strokeStartAnimation: CAAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeStart")
        animation.beginTime = 0.5
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 2
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        let group = CAAnimationGroup()
        group.duration = 2.5
        group.repeatCount = MAXFLOAT
        group.animations = [animation]
        
        return group
    }()
    
    

    
    func setup() {
        circleLayer.lineWidth = lineWidth
        circleLayer.fillColor = nil
        innerCircle.lineWidth = lineWidth
        innerCircle.fillColor = nil
        if doubleSpiner{
            layer.addSublayer(circleLayer)
            layer.addSublayer(innerCircle)
        }else{
            layer.addSublayer(circleLayer)
        }
        tintColorDidChange()
    }
    
    override func tintColorDidChange() {
        super.tintColorDidChange()
        circleLayer.strokeColor = tintColor.cgColor
        innerCircle.strokeColor = tintColor.cgColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let radius = min(bounds.width, bounds.height) / 2 - circleLayer.lineWidth/2
        let innerRadius = min(bounds.width, bounds.height) / 4 - innerCircle.lineWidth/4
        
        let startAngle = CGFloat(.pi * -2.0)
        let endAngle = startAngle + CGFloat(.pi * 2.0) - CGFloat(.pi * 0.3)
        let path = UIBezierPath(arcCenter: CGPoint.zero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        let innerPath = UIBezierPath(arcCenter: CGPoint.zero, radius: innerRadius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        circleLayer.position = center
        circleLayer.path = path.cgPath
        innerCircle.position = center
        innerCircle.path = innerPath.cgPath
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    

}
