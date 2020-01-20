//
//  EntityManager.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 17/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityManager : NSObject, InputDelegate{

    let scene : SKScene
    
    var entities = Set<GKEntity>()
    var entitiesToRemove = Set<GKEntity>()
    
    var graphs : [String : GKGraph] = [:]
    
    // Current State of the input
    var inputState : InputState = .none
    // Positions where the input went through
    var positionsDragged : [CGPoint] = []
    
    /// Dicionário com todos os componentSystem do jogo
    private lazy var componentSystems: [Components : GKComponentSystem] = {
        
        let tapMoveSystem = GKComponentSystem(componentClass: TapMoveComponent.self)
        let dragMoveSystem = GKComponentSystem(componentClass: DragMoveComponent.self)
        let spriteSystem = GKComponentSystem(componentClass: SpriteComponent.self)
        
        return [.tapMoveComponent : tapMoveSystem,
                .dragMoveComponent : dragMoveSystem,
                .spriteComponent : spriteSystem
               ]
    } ()
    
    init(scene: SKScene){
        self.scene = scene
    }
    
    func add(_ entity: GKEntity){
        
        //Adicionando os componentes encontrados na entidade nos Component System do jogo
        for componentSystem in componentSystems {
            componentSystem.value.addComponent(foundIn: entity)
        }
        
        entities.insert(entity)
        
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node{
            scene.addChild(spriteNode)
        }
    }
    
    func add(_ entity: GKEntity, from scene: SKScene, withName name: String){
        
        if let spriteNode = scene.childNode(withName: name) as? SKSpriteNode{
            spriteNode.removeFromParent()
            let spriteComponent = SpriteComponent(spriteNode: spriteNode)
            entity.addComponent(spriteComponent)
        }
        self.add(entity)
    }
    
    func remove(_ entity: GKEntity){
        if let spriteNode = entity.component(ofType: SpriteComponent.self)?.node{
            spriteNode.removeFromParent()
        }
        
        entities.remove(entity)
        
        entitiesToRemove.insert(entity)
    }
    
    func update(_ deltaTime : TimeInterval){
        
        //Atualiza todos os componentes das entidades no controle por meio dos Component Systems
        for componentSystem in componentSystems {
            componentSystem.value.update(deltaTime: deltaTime)
        }
        
        //Remoção dos componentes das entidades que serão removidas dos Compponent Systems
        for entityToRemove in entitiesToRemove{
            for componentSystem in componentSystems {
                componentSystem.value.removeComponent(foundIn: entityToRemove)
            }
        }
        
        //Remoção final das entidades deletadas
        entitiesToRemove.removeAll()
    }
    
    //--------- Player Input ---------
    func inputDidBegin(in location: CGPoint) {
        inputState = .began
        positionsDragged.append(location)
    }
    
    func inputDidMove(to location: CGPoint){
        //TODO: Optimize tap/drag recognition
        if positionsDragged.count > 2{
            inputState = .dragged
        }
        positionsDragged.append(location)
    }
    
    func inputDidEnd(in location: CGPoint){
        
        // If the user dragged we should have an array of points by now
        
        //Choose the correct array
        positionsDragged.append(location)
        let positions = inputState == .dragged ? positionsDragged : []
        
        //Clean the input aux variables
        inputState = .none
        positionsDragged.removeAll()
        
        //Execute the move
        guard let dragMoveSystem = componentSystems[.dragMoveComponent]?.components as? [DragMoveComponent] else {return}
        
        for component in dragMoveSystem{
            component.positions = positions
        }
    }
       
}
