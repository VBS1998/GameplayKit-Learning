//
//  GKEntity+Extension.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 21/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//
import SpriteKit
import GameplayKit

extension GKEntity{
    
    convenience init(from scene : SKScene, imageName name : String){
        self.init()
        
        if let spriteNode = scene.childNode(withName: name) as? SKSpriteNode {
            spriteNode.removeFromParent()
            let spriteComponent = SpriteComponent(spriteNode: spriteNode)
            self.addComponent(spriteComponent)
        }
    }
    
    convenience init(imageName: String){
        self.init()
        
        let spriteComponent = SpriteComponent(texture: SKTexture(imageNamed: imageName))
        self.addComponent(spriteComponent)
    }
}
