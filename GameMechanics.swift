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
                // Trocar a cor do último objeto da sequência para azul
                gameBoard.board[i + consecutiveCount - 1][j].appearence = defineColor(randomType())
            }
        }
    }
}

//Verify if 4 or more objects are connected
func connect4Row(row: Int, column: Int,manager: GameBoardManager){
    let gameBoard = manager.gameBoard
    var positionsRow:[Int] = []
    var positionsColumn:[Int] = []
    
    for i in 0..<gameBoard.board.count {
        var sequenceColor = Color.clear
        var consecutiveCounter = 0
        for j in 0..<gameBoard.board[i].count {
            let currentColor = gameBoard.board[i][j].appearence
            if currentColor == sequenceColor {
                consecutiveCounter += 1
//                positions.append([i,j])
                positionsRow.append(j)
            } else {
                sequenceColor =  currentColor
                consecutiveCounter = 1
                positionsRow.removeAll()
                
            }
            if consecutiveCounter >= 4{
                print("4 or more in a row")
                positionsRow.insert(positionsRow[0]-1, at: 0 )
                print(positionsRow)
                
                for k in 0..<positionsRow.count{
                    print(positionsRow[k])
                    gameBoard.board[row].remove(at: positionsRow[k])
                    
//                    gameBoard.board[row].insert(HouseObject(appearence: defineColor(randomType())), at: positionsRow[k])
                }
            }
        }
//        print(positions)
    }
//    print(positions)
    
    for j in 0..<gameBoard.board[0].count{
        var sequenceColor = Color.clear
        var consecutiveCounter = 0
        for i in 0..<gameBoard.board.count{
            let currentColor = gameBoard.board[i][j].appearence
            if currentColor == sequenceColor {
                consecutiveCounter += 1
                positionsColumn.append(i)
            } else {
                sequenceColor =  currentColor
                consecutiveCounter = 1
                positionsColumn.removeAll()
            }
            if consecutiveCounter >= 4{
                print("4 or more in a column")
                positionsColumn.insert(positionsColumn[0]-1, at: 0 )
                for k in 0..<positionsColumn.count{
                    print(positionsColumn[k])
                    gameBoard.board[positionsColumn[k]].remove(at: column)
                    gameBoard.board[positionsColumn[k]].insert(HouseObject(appearence: defineColor(randomType())), at: column)
                }
            }
        }
    }
    
}

//func generateRow(row: Int, numberOfElements: Int, manager: GameBoardManager){
//    var gameBoard = manager.gameBoard
//    for i in 0..<numberOfElements{
//        gameBoard.board[row].insert(HouseObject(appearence: defineColor(randomType()) ), at: i)
//    }
//    
//}


//func deleteRow(positions:[[Int, Int]], manager:GameBoardManager){
//    
//}
