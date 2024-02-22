//
//  GameBoardManager.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 01/02/24.
//

import Foundation
import SwiftUI

class GameBoardManager: ObservableObject {
    @Published var gameBoard: Matrix
    
    init() {
        self.gameBoard = Matrix(numberOfRows: 7, numberOfColumns: 7)
        
        matrixCorrection(row:7, column: 7, manager: self)
    }
}

enum neighbors{
    case left
    case right
    case up
    case down
}

func checkNeighbor(_ type: neighbors,row1: Int, row2: Int, column1: Int,column2: Int, gameBoard: Matrix) -> Bool{
    switch type{
    case .left:
            return row1 == row2 && column1 == column2 - 1
        case .right:
            return row1 == row2 && column1 == column2 + 1
        case .up:
            return row1 == row2 - 1 && column1 == column2
        case .down:
            return row1 == row2 + 1 && column1 == column2
    }
}

class Matrix {
    var board: [[HouseObject]] = []
    var numberOfRows: Int
    var numberOfColumns: Int
    
    init(numberOfRows: Int, numberOfColumns: Int) {
        self.numberOfRows = numberOfRows
        self.numberOfColumns = numberOfColumns
        
        populateBoard()
    }
    
    func populateBoard() {
        for i in 0..<numberOfRows {
            var aux: [HouseObject] = []
            for j in 0..<numberOfColumns {
                aux.append(HouseObject(appearence: defineColor(randomType())))
            }
            board.append(aux)
        }
    }
}

class HouseObject {
    var appearence: Color
    
    init(appearence: Color) {
        self.appearence = appearence
    }
}

