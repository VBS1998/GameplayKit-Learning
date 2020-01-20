//
//  PlayerInput.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 20/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//
import SpriteKit

protocol InputDelegate : NSObjectProtocol{
    
    func inputDidBegin(in location: CGPoint)
    func inputDidMove(to location: CGPoint)
    func inputDidEnd(in location: CGPoint)
}

enum InputState {
    case none
    case began
    case dragged
    case invalid //TODO: Implement invalid moves
}
