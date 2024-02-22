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
func connect4Row(row: Int, column: Int, manager: GameBoardManager) -> (Int,Color) {
    let gameBoard = manager.gameBoard
    var positionsRow:[Int] = []
    var positionsColor:[Color] = [Color.red]
    var points = 0
    var sequenceColor = Color.clear
    var consecutiveCounter = 1
    let currentColor = gameBoard.board[row][column].appearence
    var searchColor = Color.clear
    
    
    for k in 0..<gameBoard.board[row].count{
        
        if k < gameBoard.board[row].count - 1 {
            if gameBoard.board[row][k].appearence == gameBoard.board[row][k + 1].appearence {
                consecutiveCounter += 1
                positionsRow.append(k)
                positionsColor.append(gameBoard.board[row][k].appearence)
                searchColor = positionsColor.last!
            } else {
                if consecutiveCounter >= 4 {
                    break
                }
                consecutiveCounter = 1
                positionsRow.removeAll()
                positionsColor.removeAll()
            }
        }
    }
    positionsRow.append((positionsRow.last ?? 0)+1)
    
    if positionsRow.count == 4{
        rowChange(row: row, positionsRow: positionsRow, manager: manager)
        points += 1 // Adiciona 1 ponto para cada 4 objetos em sequência
    }else if positionsRow.count == 5 && positionsRow.count % 5 == 0{
        rowChange(row: row, positionsRow: positionsRow, manager: manager)
        points += 2
    }else if positionsRow.count == 6 && positionsRow.count % 6 == 0{
        rowChange(row: row, positionsRow: positionsRow, manager: manager)
        points += 3
    }else if positionsRow.count == 7 && positionsRow.count % 7 == 0{
        rowChange(row: row, positionsRow: positionsRow, manager: manager)
        points += 4
    }
        return (points, searchColor)
    }


