//
//  EntityManager.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 17/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityManager{
    
    var entities = Set<GKEntity>()
    let scene : SKScene
    
    init(scene: SKScene){
        self.scene = scene
    }
    
    func add(_ entity: GKEntity){
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node{
            scene.addChild(spriteNode)
        }
    }
    
    func remove(_ entity: GKEntity){
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node{
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
    }
}
