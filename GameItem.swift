//
//  GameItem.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 01/02/24.
//

import Foundation
import SwiftUI

//Criacao da peca
enum pieceType: Int{
    case t1 = 1
    case t2 = 2
    case t3 = 3
    case t4 = 4
}

func defineColor(_ type: pieceType) -> Color{
    switch type{
    case .t1:
        return Color.red
    case .t2:
        return Color.blue
    case .t3:
        return Color.green
    case .t4:
        return Color.yellow
    }
}

let typesOfPiece: [pieceType] = [.t1, .t2, .t3, .t4]

func randomType() -> pieceType {
    return pieceType(rawValue:Int.random(in: 0...typesOfPiece.count)) ?? pieceType.t1
}

//Comparacao entre pecas

enum neighbors{
    case left
    case right
    case up
    case down
}

func checkNeighbor(_ type: neighbors){
    switch type{
    case .left:
        
        return
    case .right:
        
        return
    case .up:
        
        return
    case .down:
        
        return
        
        
    }
}
