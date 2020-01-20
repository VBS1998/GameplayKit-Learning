//
//  TapMoveComponent.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 17/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import GameplayKit
import SpriteKit

class TapMoveComponent : GKComponent{
    
    var position = CGPoint()
    
    func move(to dest: CGPoint){
        let spriteComponent = self.entity?.component(ofType: SpriteComponent.self)
        spriteComponent?.node.position = dest
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        //LE INPUT E ATUALIZA POOSITION
        move(to: position)
    }
}
