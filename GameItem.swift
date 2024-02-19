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

enum score: Int{
    case s1 = 4
    case s2 = 5
    case s3 = 6
    case s4 = 7
}

func defineScore(_ type: score){
    var value = 0
    switch type{
    case .s1:
        return value += 1
    case .s2:
        return value += 2
    case .s3:
        return value += 3
    case .s4:
        return value += 4
    }
}


