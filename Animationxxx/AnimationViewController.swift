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
    let centerHeight: CGFloat = UIScreen.main.bounds.height / 2
    
    init() {
        super.init(node: rootNode)
        
        rootNode.layoutSpecBlock = { _, _ in
            return ASWrapperLayoutSpec(layoutElement: self.wrapperNode)
        }
    }
 
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
