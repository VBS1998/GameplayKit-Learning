//
//  SpriteComponent.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 17/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import SpriteKit
import GameplayKit

class SpriteComponent : GKComponent {

    let node : SKSpriteNode
    
    init(texture: SKTexture){
        node = SKSpriteNode(texture: texture, color: .white, size: texture.size())
        super.init()
    }
    
    init(spriteNode: SKSpriteNode){
        node = spriteNode
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
