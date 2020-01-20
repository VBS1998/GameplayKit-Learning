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
    
    weak var playerInputDelegate : PlayerInputDelegate?
    
    override func didMove(to view: SKView) {
        super.didMove(to: view)
        
        self.entityManager = EntityManager(scene: self)
        
        let player = Player(imageName: "PlayerStill")
        player.removeComponent(ofType: SpriteComponent.self)
        if let playerSpriteNode = self.childNode(withName: "Player") as? SKSpriteNode{
            playerSpriteNode.removeFromParent()
            let spriteComponent = SpriteComponent(spriteNode: playerSpriteNode)
            player.addComponent(spriteComponent)
        }
        entityManager.add(player)
    }
    
    override func sceneDidLoad() {
        super.sceneDidLoad()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch in touches{
            playerInputDelegate?.playerInputDidChange(to: .tap)
            playerInputDelegate?.playerInputDidTap(in: touch.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
    }
}
