//
//  DragMoveComponent.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 20/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//
import SpriteKit
import GameplayKit

class DragMoveComponent : GKComponent{
    
    var positions : [CGPoint] = []
    var framesToWait : Int
    var framesUntilMove : Int = 0
    
    init(speed: Int){
        framesToWait = 60/speed + 1
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func update(deltaTime seconds: TimeInterval) {
        super.update(deltaTime: seconds)
        
        if positions.count > 0{
            if framesUntilMove == 0{
                self.move(to: positions[0])
                positions.remove(at: 0)
                framesUntilMove = framesToWait
            }else{
                framesUntilMove -= 1
            }
        }else{
            framesUntilMove = 0
        }
    }
    
    func move(to dest: CGPoint){
        let spriteComponent = self.entity?.component(ofType: SpriteComponent.self)
        spriteComponent?.node.position = dest
    }
}
