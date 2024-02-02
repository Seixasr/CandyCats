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

func checkNeighbor(_ type: neighbors,row: Int, column: Int, gameBoard: Matrix) -> Bool{
    switch type{
    case .left:
        return isValidIndex(row, column-1, gameBoard)
    case .right:
        return isValidIndex(row, column+1, gameBoard)
    case .up:
        return isValidIndex(row-1, column, gameBoard)
    case .down:
        return isValidIndex(row+1, column, gameBoard)
    }
}


func returnNeighbor(row: Int, column: Int, gameBoard: Matrix){
    //Left
    if checkNeighbor(.left, row: row, column: column, gameBoard: gameBoard) == false{
        print("esquerda:Nao há vizinho")
    }else{
        print("esquerda: \(gameBoard.board[row][column-1].appearence)")
    }
    
    //Right
    if checkNeighbor(.right, row: row, column: column, gameBoard: gameBoard) == false{
        print("direta: Nao há vizinho")
    }else{
        print("direita: \(gameBoard.board[row][column+1].appearence)")
    }
    
    //Up
    if checkNeighbor(.up, row: row, column: column, gameBoard: gameBoard) == false{
        print("cima: Nao há vizinho")
    }else{
        print("cima: \(gameBoard.board[row-1][column].appearence)")
    }
    
    //Down
    if checkNeighbor(.down, row: row, column: column, gameBoard: gameBoard) == false{
        print("baixo: Nao há vizinho")
    }else{
        print("baixo: \(gameBoard.board[row+1][column].appearence)")
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
                aux.append(HouseObject(row: i, column: j, appearence: defineColor(randomType())))
            }
            board.append(aux)
        }
    }
}

class HouseObject {
    var row: Int
    var column: Int
    var appearence: Color
    
    init(row: Int, column: Int, appearence: Color) {
        self.row = row
        self.column = column
        self.appearence = appearence
    }
}

