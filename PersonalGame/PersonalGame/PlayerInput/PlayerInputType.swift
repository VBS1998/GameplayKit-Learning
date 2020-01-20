//
//  PlayerInput.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 20/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//
import SpriteKit

protocol PlayerInputDelegate : NSObjectProtocol{
    
    func playerInputDidChange(to actualInputType: PlayerInputType)
    func playerInputDidTap(in position: CGPoint)
}

enum PlayerInputType {
    case none
    case tap
}
