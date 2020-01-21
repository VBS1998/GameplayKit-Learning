//
//  GameScene.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 17/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entityManager : EntityManager!
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    weak var inputDelegate : InputDelegate?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        //Initializing the manager and getting the entities and graphs in the sks.
        entityManager = EntityManager(scene: self)
        for entity in entities{
            entityManager.add(entity)
        }
        entityManager.graphs = graphs
        
        //Creating the Player
        entityManager.add(Player(from: self, imageName: "Player"))
        
        //The entity manager should handle the input
        inputDelegate = entityManager
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //It should ignore the touches other than the first
        if let touch = touches.first{
            inputDelegate?.inputDidBegin(in: touch.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            inputDelegate?.inputDidMove(to: touch.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            inputDelegate?.inputDidEnd(in: touch.location(in: self))
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        entityManager.update(currentTime)
    }
}
