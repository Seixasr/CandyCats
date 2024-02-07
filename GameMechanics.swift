//
//  GameMechanics.swift
//  TestWwdc
//
//  Created by Rafael Santos Seixas Figueiredo on 01/02/24.
//

import Foundation
import SwiftUI

var clickedObjects: [HouseObject] = []
var rowClickedObjects: [Int] = []
var columnClickedObjects: [Int] = []
var row1:Int = 0
var column1:Int = 0
var row2:Int = 0
var column2:Int = 0


func changePosition(row: Int, column: Int, manager: GameBoardManager){
    
    var gameBoard = manager.gameBoard
    clickedObjects.append(gameBoard.board[row][column])
    rowClickedObjects.append(row)
    columnClickedObjects.append(column)
    
    if clickedObjects.count == 2{
        row1 = rowClickedObjects[0]
        column1 = columnClickedObjects[0]
        row2 = rowClickedObjects[1]
        column2 = columnClickedObjects[1]
        
        
        //Verificar se os dois clicados sao vizinhos
        
        var areNeighbors = false
        var originalColor = gameBoard.board[row1][column1].appearence
        for neighbor in [neighbors.left, .right, .up, .down]{
            if checkNeighbor(neighbor, row1: rowClickedObjects[0], row2: rowClickedObjects[1], column1: columnClickedObjects[0], column2: columnClickedObjects[1], gameBoard: gameBoard){
                areNeighbors = true
                
                break
            }
        }
        
        if areNeighbors {
            
            gameBoard.board[row1][column1].appearence = gameBoard.board[row2][column2].appearence
            gameBoard.board[row2][column2].appearence = originalColor
        } else {
        }
        
        clickedObjects.removeAll()
        rowClickedObjects.removeAll()
        columnClickedObjects.removeAll()
        
        let board = gameBoard.board
        gameBoard.board = board
        
        manager.gameBoard = gameBoard
    }
}

func matrixCorrection(row: Int, column: Int, manager: GameBoardManager) {
    var gameBoard = manager.gameBoard
    let consecutiveCount = 3 // A quantidade mínima para considerar uma sequência
    
    // Analisar as linhas
    for i in 0..<row {
        for j in 0..<(column - consecutiveCount + 1) {
            let currentColor = gameBoard.board[i][j].appearence
            var isConsecutive = true
            
            for k in 1..<consecutiveCount {
                if gameBoard.board[i][j + k].appearence != currentColor {
                    isConsecutive = false
                    break
                }
            }
            
            if isConsecutive {
                print("mesma cor na linha \(i), posição: \(i) / \(j), cor: \(currentColor)")
                
                // Trocar a cor do último objeto da sequência para azul
                gameBoard.board[i][j + consecutiveCount - 1].appearence = defineColor(randomType())
            }
        }
    }
    
    // Analisar as colunas
    for j in 0..<column {
        for i in 0..<(row - consecutiveCount + 1) {
            let currentColor = gameBoard.board[i][j].appearence
            var isConsecutive = true
            
            for k in 1..<consecutiveCount {
                if gameBoard.board[i + k][j].appearence != currentColor {
                    isConsecutive = false
                    break
                }
            }
            
            if isConsecutive {
                print("mesma cor na coluna \(j), posição: \(i) / \(j), cor: \(currentColor)")
                
                // Trocar a cor do último objeto da sequência para azul
                gameBoard.board[i + consecutiveCount - 1][j].appearence = defineColor(randomType())
            }
        }
    }
}

//func matrixCorrection(row: Int, column: Int, manager: GameBoardManager){
//    var gameBoard = manager.gameBoard
//    var consecutiveRed = 0
//    for i in 0 ..< row{
//        for j in 0 ..< column-3{
//            if gameBoard.board[i][j].appearence == gameBoard.board[i][j+1].appearence && gameBoard.board[i][j+1].appearence == gameBoard.board[i][j+2].appearence {
//                print("mesma cor na linha\(i), posicao: \(i) / \(j+1), cor: \(gameBoard.board[i][j+1].appearence)")
//                if gameBoard.board[i][j].appearence == Color.red{
//                    consecutiveRed += 1
//                    if consecutiveRed == 1{
//                        gameBoard.board[i][j+3].appearence = Color.blue
//                        consecutiveRed = 0
//                    }
//                }
//                
//                
//            }
//        }
//    }
//    print(consecutiveRed)
//   
//}
