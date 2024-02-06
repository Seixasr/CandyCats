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
        self.gameBoard = Matrix(numberOfRows: 9, numberOfColumns: 9)
    }
}

enum neighbors{
    case left
    case right
    case up
    case down
}

func isValidIndex(_ row: Int, _ column: Int, _ gameBoard: Matrix) -> Bool {
    return row >= 0 && row < gameBoard.board.count && column >= 0 && column < gameBoard.board[row].count
}

func checkNeighbor(_ type: neighbors,row1: Int, row2: Int, column1: Int,column2: Int, gameBoard: Matrix) -> Bool{
    switch type{
    case .left:
        if row1 == row2 && column1 == column2 - 1{
            return isValidIndex(row1, column1-1, gameBoard)
        }else{
            return false
        }
    case .right:
        if row1 == row2 && column1 == column2+1{
            return isValidIndex(row1, column1+1, gameBoard)
        }else{
            return false
        }
    case .up:
        if row1 == row2 - 1 && column1 == column2{
            return isValidIndex(row1-1, column1, gameBoard)
        }else{
            return false
        }
    case .down:
        if row1 == row2+1 && column1 == column2{
            return isValidIndex(row1+1, column1, gameBoard)
        }else{
            return false
        }
    }
}


//func returnNeighbor(row1: Int, column1: Int, row2: Int, column2: Int, gameBoard: Matrix){
//    //Left
//    if checkNeighbor(.left, row1: row1, row2: row2, column1: column1, column2: column2, gameBoard: gameBoard) == false{
//        print("esquerda:Nao há vizinho")
//    }else{
//        print("esquerda: \(gameBoard.board[row1][column1-1].appearence)")
//    }
//    
//    //Right
//    if checkNeighbor(.right, row1: row1, row2: row2, column1: column1, column2: column2, gameBoard: gameBoard) == false{
//        print("direta: Nao há vizinho")
//    }else{
//        print("direita: \(gameBoard.board[row1][column1+1].appearence)")
//    }
//    
//    //Up
//    if checkNeighbor(.up, row1: row1, row2: row2, column1: column1, column2: column2, gameBoard: gameBoard){
//        print("cima: Nao há vizinho")
//    }else{
//        print("cima: \(gameBoard.board[row1-1][column1].appearence)")
//    }
//    
//    //Down
//    if checkNeighbor(.down, row1: row1, row2: row2, column1: column1, column2: column2, gameBoard: gameBoard) == false{
//        print("baixo: Nao há vizinho")
//    }else{
//        print("baixo: \(gameBoard.board[row1+1][column1].appearence)")
//    }
//}

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

