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
    
    let gameBoard = manager.gameBoard
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
        let originalColor = gameBoard.board[row1][column1].appearence
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

func changePositionMatrix(row:Int,column:Int,rowLenght:Int,manager:GameBoardManager){
    let gameBoard = manager.gameBoard
    
    if row == 0{
        gameBoard.board[0][column].appearence = defineColor(randomType())
    }else{
        for k in (0...row).reversed(){
            if k-1 >= 0{
                gameBoard.board[k][column].appearence = gameBoard.board[k-1][column].appearence
            }
        }
    }
}

func matrixCorrection(row: Int, column: Int, manager: GameBoardManager) {
    let gameBoard = manager.gameBoard
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

func rowChange(row: Int, positionsRow: [Int],manager: GameBoardManager){
    var currentRowIndex = row
    let gameBoard = manager.gameBoard
    while currentRowIndex > 0{
        for k in 0..<positionsRow.count {
            let column = positionsRow[k]
            let tempColor = gameBoard.board[currentRowIndex][column].appearence
            gameBoard.board[currentRowIndex][column].appearence = gameBoard.board[currentRowIndex - 1][column].appearence
            gameBoard.board[currentRowIndex - 1][column].appearence = tempColor
        }
        currentRowIndex -= 1
    }
    let topRow = 0
    for k in 0..<positionsRow.count {
        let column = positionsRow[k]
        gameBoard.board[topRow][column].appearence = defineColor(randomType())
    }
}

//Verify if 4 or more objects are connected
func connect4Row(row: Int, column: Int, manager: GameBoardManager, redPoints: Int, bluePoints: Int, greenPoints: Int, yellowPoints: Int, color: Color) -> Int {
    let gameBoard = manager.gameBoard
    var positionsRow:[Int] = []
    var points = 0
    var sequenceColor = Color.clear
    
    // Verificação na horizontal
    //    for i in 0..<gameBoard.board.count {
    var consecutiveCounter = 1
    let currentColor = gameBoard.board[row][column].appearence
    
    
    for k in 0..<gameBoard.board[row].count-1{
        
        if gameBoard.board[row][k].appearence == gameBoard.board[row][k + 1].appearence {
            consecutiveCounter += 1
            positionsRow.append(k)
        } else {
            if consecutiveCounter >= 4 {
                break
            }
            consecutiveCounter = 1
            positionsRow.removeAll()
        }
    }
    print(consecutiveCounter)
    //Pra frente de onde apertou
//    for k in column..<gameBoard.board[row].count {
//        
//        if k < 8 {
//            if gameBoard.board[row][k].appearence == gameBoard.board[row][k + 1].appearence {
//                consecutiveCounter += 1
//                positionsRow.append(k)
//            } else {
//                positionsRow.removeAll()
//                consecutiveCounter = 0
//            }
//        } else {
//            if gameBoard.board[row][k].appearence == gameBoard.board[row][k - 1].appearence {
//                consecutiveCounter += 1
//                positionsRow.append(k)
//            } else {
//                positionsRow.removeAll()
//                consecutiveCounter = 0
//            }
//        }
//    }
//    
//    //Pra trás de onde apertou
//    for k in 0..<column {
//        if k > 0 {
//            if gameBoard.board[row][k].appearence == gameBoard.board[row][k - 1].appearence {
//                consecutiveCounter += 1
//                positionsRow.append(k)
//            } else {
//                positionsRow.removeAll()
//                consecutiveCounter = 0
//            }
//        } else {
//            if gameBoard.board[row][k].appearence == gameBoard.board[row][k + 1].appearence {
//                consecutiveCounter += 1
//                positionsRow.append(k)
//            } else {
//                positionsRow.removeAll()
//                consecutiveCounter = 0
//            }
//        }
//    }
        
        //            if gameBoard.board[row][j].appearence == currentColor {
        //                consecutiveCounter += 1
        //                positionsRow.append(j)
        //                print("entendeu")
        //            } else {
        //                consecutiveCounter = 0
        //            }
        
        //            if currentColor == sequenceColor {
        //                consecutiveCounter += 1
        //                positionsRow.append(j)
        //            }else {
        //                sequenceColor = currentColor
        //                consecutiveCounter = 1
        //                positionsRow.removeAll()
        //            }
        if consecutiveCounter >= 4 {
            rowChange(row: row, positionsRow: positionsRow, manager: manager)
            points += 1 // Adiciona 1 ponto para cada 4 objetos em sequência
            print(positionsRow)
            consecutiveCounter = 0
        } else if consecutiveCounter >= 5 && consecutiveCounter % 5 == 0 {
            points += 2 // Adiciona 2 pontos para cada 5 objetos em sequência
            print(points)
        } else if consecutiveCounter >= 6 && consecutiveCounter % 6 == 0 {
            points += 3 // Adiciona 3 pontos para cada 6 objetos em sequência
            print(points)
        }else if consecutiveCounter >= 7 && consecutiveCounter % 7 == 0 {
            points += 4 // Adiciona 3 pontos para cada 6 objetos em sequência
            print(points)
        }
        return points
    }



// Verificação na vertical
//    for j in 0..<gameBoard.board[0].count{
//        var sequenceColor = Color.clear
//        var consecutiveCounter = 0
//        var lastRow = 0
//        for i in 0..<gameBoard.board.count {
//            let currentColor = gameBoard.board[i][j].appearence
//            if currentColor == sequenceColor {
//                consecutiveCounter += 1
//                lastRow = i
//            }else if consecutiveCounter >= 4 {
//                var currentColumnIndex = j
//
//                while currentColumnIndex > 0 {
//                    for k in 0..<positionsColumn.count{
//                        let tempColor = gameBoard.board[positionsColumn[k]][currentColumnIndex].appearence
//                        gameBoard.board[positionsColumn[k]][currentColumnIndex].appearence = gameBoard.board[positionsColumn[k]][currentColumnIndex-1].appearence
//                        gameBoard.board[positionsColumn[k]][currentColumnIndex-1].appearence = tempColor
//                    }
//                    currentColumnIndex -= 1
//                }
////                let topRow2 = 0
////                for k in 0..<positionsColumn.count{
////                    gameBoard.board[topRow2][positionsColumn[k]].appearence = defineColor(randomType())
////                }
//                break
//            }else {
//                sequenceColor =  currentColor
//                consecutiveCounter = 1
//                positionsColumn = [i]
//            }
//        }
//    }


