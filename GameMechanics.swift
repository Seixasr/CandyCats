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
