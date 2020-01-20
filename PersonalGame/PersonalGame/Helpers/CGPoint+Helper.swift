
//
//  Helpers.swift
//  PersonalGame
//
//  Created by Gustavo Vilas Boas on 20/01/20.
//  Copyright © 2020 Gustavo Vilas Boas. All rights reserved.
//

import SpriteKit

extension CGPoint{
    func distance(to point: CGPoint) -> CGFloat{
        
        let x1 = Double(x)
        let x2 = Double(point.x)
        let y1 = Double(y)
        let y2 = Double(point.y)
        
        return CGFloat(sqrt( pow(x1-x2, 2) + pow(y1-y2, 2) ))
    }
}
