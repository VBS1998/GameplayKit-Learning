//
//  Player.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 17/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import SpriteKit
import GameplayKit

class Player : GKEntity{
    
    override init(){
        super.init()
        self.addComponent(TapStopComponent())
        self.addComponent(DragMoveComponent(speed: 10))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
