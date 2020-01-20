//
//  EntityManager.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 17/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import SpriteKit
import GameplayKit

class EntityManager : NSObject, PlayerInputDelegate{
   
    let scene : SKScene
    
    var entities = Set<GKEntity>()
    var entitiesToRemove = Set<GKEntity>()
    
    /// Dicionário com todos os componentSystem do jogo
    private lazy var componentSystems: [Components : GKComponentSystem] = {
        
        let tapMoveSystem = GKComponentSystem(componentClass: TapMoveComponent.self)
        let spriteSystem = GKComponentSystem(componentClass: SpriteComponent.self)
        
        return [.tapMoveComponent : tapMoveSystem,
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
    func playerInputDidChange(to actualInputType: PlayerInputType) {
        
    }
       
    func playerInputDidTap(in position: CGPoint) {
        guard let tapMoveSystem = componentSystems[.tapMoveComponent]?.components as? [TapMoveComponent] else {return}
        
        for component in tapMoveSystem{
            component.position = position
        }
    }
       
}
