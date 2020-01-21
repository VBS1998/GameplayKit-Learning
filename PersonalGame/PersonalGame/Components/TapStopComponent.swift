//
//  TapStopComponent.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 21/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import GameplayKit

class TapStopComponent : GKComponent{
    
    var shouldStop : Bool = false
    
    override func update(deltaTime seconds: TimeInterval) {
        if shouldStop{
            if let drag = self.entity?.component(ofType: DragMoveComponent.self){
                drag.positions = []
                drag.framesUntilMove = 0
            }
            shouldStop = false
        }
    }
}
