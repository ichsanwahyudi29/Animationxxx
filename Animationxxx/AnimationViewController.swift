//
//  AnimationViewController.swift
//  Animationxxx
//
//  Created by nakama on 20/11/19.
//  Copyright © 2019 ichsan. All rights reserved.
//

import AsyncDisplayKit

class AnimationViewController: ASViewController<ASDisplayNode> {
    let rootNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.automaticallyManagesSubnodes = true
        
        return node
    }()
    
    let wrapperNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.style.width = ASDimensionMake("100")
        node.style.height = ASDimensionMake("100%")
        node.backgroundColor = .white
        
        return node
    }()
    
    let centerWidth: CGFloat = UIScreen.main.bounds.width / 2
    let mainHeight: CGFloat = UIScreen.main.bounds.height / 2
    
    let box1: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 50, y: 50, width: 20, height: 20)
//            layer.bounds = CGRect(x: 0, y: 0, width: 50, height: 50)
//            layer.position = CGPoint(x: 50, y: 50)
//        layer.anchorPoint = CGPoint(x: 0, y: 0)
        layer.backgroundColor = UIColor.red.cgColor
        layer.fillColor = UIColor.red.cgColor
        layer.path = UIBezierPath(rect: layer.bounds).cgPath
        
//        layer.lineWidth = 10
//        layer.lineJoin = .round
//        layer.strokeColor = UIColor.blue.cgColor
        
        print("anchorPoint : \(layer.anchorPoint)")
        print("position : \(layer.position)")
        
        return layer
    }()
    
    let box2: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 50, y: 50, width: 50, height: 50)
//            layer.backgroundColor = UIColor.black.cgColor
        layer.fillColor = UIColor.blue.cgColor
        layer.borderColor = UIColor.red.cgColor
        
        let arcCenter = layer.position
        let radius = layer.bounds.size.width / 2.0
        let startAngle = CGFloat(0.0)
        let endAngle = CGFloat(2.0 * .pi)
        let clockwise = true
        
        layer.path = UIBezierPath(arcCenter: arcCenter, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise).cgPath
        
        return layer
    }()
    
    let box3: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 150, y: 150, width: 50, height: 50)
        layer.lineWidth = 2.0
//            layer.backgroundColor = UIColor.black.cgColor
        layer.fillColor = nil
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: 80.0))
        path.addLine(to: CGPoint(x: 80.0, y: 80.0))
        path.addLine(to: CGPoint(x: 80.0, y: 0.0))
        
        layer.path = path.cgPath
        layer.strokeColor = UIColor.red.cgColor
        layer.strokeStart = 0.1
        layer.strokeEnd = 1.0
        
        return layer
    }()

    let box4: CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.frame = CGRect(x: 250, y: 250, width: 50, height: 50)
        layer.fillColor = nil

//        let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: layer.frame.width, height: layer.frame.height))
        let path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: layer.frame.width, height: layer.frame.height))

        layer.lineWidth = 2.0
//        layer.lineDashPattern = [47.12]
        layer.path = path.cgPath
        layer.strokeColor = UIColor.black.cgColor
        layer.strokeStart = 0.0
        layer.strokeEnd = 1.0
        
        return layer
    }()
    
    init() {
        super.init(node: rootNode)
        
//        setupLayer()
//        starSquareAnimate()
        
        layerAnimate()
        
        rootNode.layoutSpecBlock = { _, _ in
            return ASWrapperLayoutSpec(layoutElement: self.wrapperNode)
        }
    }
    
    func layerAnimate() {
        let layer: CALayer = {
            let layer = CALayer()
            layer.frame = CGRect(x: centerWidth , y: mainHeight - 50, width: 50, height: 50)
            layer.backgroundColor = UIColor.red.cgColor

            return layer
        }()
        
        wrapperNode.layer.addSublayer(layer)
    }
    
    func starSquareAnimate() {
        let shapeLayer: CAShapeLayer = {
            let shapeLayer = CAShapeLayer()
            shapeLayer.frame  = CGRect(x: centerWidth / 2 - 75, y: 50, width: 0, height: 0)
            shapeLayer.lineWidth = 2
            shapeLayer.fillColor = nil
            shapeLayer.strokeColor = UIColor.red.cgColor
            
            return shapeLayer
        }()
        
        let starPath = UIBezierPath()
        starPath.move(to: CGPoint(x: 81.5, y: 7.0))
        starPath.addLine(to: CGPoint(x: 101.07, y: 63.86))
        starPath.addLine(to: CGPoint(x: 163.0, y: 64.29))
        starPath.addLine(to: CGPoint(x: 113.16, y: 99.87))
        starPath.addLine(to: CGPoint(x: 131.87, y: 157.0))
        starPath.addLine(to: CGPoint(x: 81.5, y: 122.13))
        starPath.addLine(to: CGPoint(x: 31.13, y: 157.0))
        starPath.addLine(to: CGPoint(x: 49.84, y: 99.87))
        starPath.addLine(to: CGPoint(x: 0.0, y: 64.29))
        starPath.addLine(to: CGPoint(x: 61.93, y: 63.86))
        starPath.addLine(to: CGPoint(x: 81.5, y: 7.0))

        let rectanglePath = UIBezierPath()
        rectanglePath.move(to: CGPoint(x: 81.5, y: 7.0))
        rectanglePath.addLine(to: CGPoint(x: 163.0, y: 7.0))
        rectanglePath.addLine(to: CGPoint(x: 163.0, y: 82.0))
        rectanglePath.addLine(to: CGPoint(x: 163.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 163.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 82.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: 157.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: 82.0))
        rectanglePath.addLine(to: CGPoint(x: 0.0, y: 7.0))
        rectanglePath.addLine(to: CGPoint(x: 81.5, y: 7.0))

        // Set an initial path
        shapeLayer.path = starPath.cgPath

        let pathAnimation = CABasicAnimation(keyPath: "path")
        pathAnimation.toValue = rectanglePath.cgPath
        pathAnimation.duration = 1.25
        pathAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pathAnimation.autoreverses = true
        pathAnimation.repeatCount = .greatestFiniteMagnitude

        shapeLayer.add(pathAnimation, forKey: "pathAnimation")
        
        wrapperNode.layer.addSublayer(shapeLayer)
    }
    
    func setupLayer() {
        
        let box5: CAShapeLayer = {
            let layer = CAShapeLayer()
            layer.frame = CGRect(x: centerWidth / 2 - 25, y: 50, width: 50, height: 50)
            layer.fillColor = nil

            let path = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: layer.frame.width, height: layer.frame.height))

            layer.lineWidth = 3.0
            layer.lineDashPattern = [25]
            layer.path = path.cgPath
            layer.strokeColor = UIColor.black.cgColor
            layer.strokeStart = 0.0
            layer.strokeEnd = 1.0
            layer.transform = CATransform3DMakeRotation(-CGFloat.pi / 2, 0.0, 0.0, 1.0)
            
            return layer
        }()
        
        wrapperNode.layer.addSublayer(box5)
        
//        addAnimation(
//            target: box5,
//            keyPath: "strokeEnd",
//            duration: 2.0,
//            easing: .init(controlPoints: 0.65, 0.04, 0.33, 0.86),
//            forKey: "strokeEndFirst"
//        )
        
        addAnimation(
            target: box5,
            keyPath: "transform.rotation",
            duration: 1.0,
            easing: .init(controlPoints: 0.65, 0.04, 0.33, 0.86),
            forKey: "transformKey"
        )
        
    }

    private func addAnimation(target: CAShapeLayer, keyPath: String, duration: CFTimeInterval, fromValue: CGFloat = 0.0, toValue: CGFloat = 1.0, beginTime: CGFloat = 0.0, easing: CAMediaTimingFunction?, forKey: String) {
        let animation = CABasicAnimation(keyPath: keyPath)
//        animation.delegate = self
//        animation.beginTime = CACurrentMediaTime() + Double(beginTime)
        animation.duration = duration
        animation.fromValue = fromValue
        animation.toValue = toValue
//        animation.timingFunction = easing
//        animation.timingFunction = .init(name: CAMediaTimingFunctionName.easeInEaseOut)
        animation.fillMode = .both
        animation.repeatCount = .greatestFiniteMagnitude
        animation.isRemovedOnCompletion = false

        target.add(animation, forKey: forKey)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
