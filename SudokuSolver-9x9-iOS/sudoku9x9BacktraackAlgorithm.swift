//
//  sudoku9x9BacktraackAlgorithm.swift
//  SudokuSolver-9x9-iOS
//
//  Created by Pratama One on 17/10/24.
//

import Foundation

// Sample of game Sudoku 9 x 9
// Hard level
var grid = [
    [1, 0, 0, 0, 0, 6, 7, 0, 0],
    [0, 5, 0, 7, 0, 0, 0, 2, 3],
    [0, 0, 0, 0, 2, 3, 0, 0, 0],
    [2, 1, 0, 0, 0, 0, 8, 0, 0],
    [0, 6, 0, 0, 0, 0, 0, 0, 4],
    [8, 9, 0, 2, 1, 4, 0, 0, 0],
    [5, 0, 1, 0, 0, 2, 0, 0, 0],
    [0, 4, 0, 0, 0, 0, 5, 0, 0],
    [0, 7, 0, 0, 0, 0, 0, 0, 2]
]

func isValid(_ grid: [[Int]], row: Int, col: Int, num: Int) -> Bool {
    // Check the rows from left to right
    for i in 0..<9 {
        if grid[row][i] == num { return false }
    }
    
    // Check the columns from top to bottom
    for i in 0..<9 {
        if grid[i][col] == num { return false }
    }
    
    // Check sub columns 3 x 3
    let startRow = row - (row % 3)
    let startCol = col - (col % 3)
    for i in 0..<3 {
        for j in 0..<3 {
            if grid[i + startRow][j + startCol] == num { return false }
        }
    }
    
    return true
}

func solveSudoku(_ grid: inout [[Int]]) -> Bool {
    for row in 0..<9 {
        for col in 0..<9 {
            if grid[row][col] == 0 {
                for num in 1...9 {
                    if isValid(grid, row: row, col: col, num: num) {
                        grid[row][col] = num
                        
                        // Just to see what happens
                        print("Grid updated with \(num) at row \(row), col \(col):")
                        for row in grid {
                            print(row)
                        }
                        print("\n")
                        // End
                        
                        if solveSudoku(&grid) {
                            return true
                        }
                        grid[row][col] = 0 // Backtrack
                        
                        // Just to see what happens
                        print("Backtracking at row \(row), col \(col):")
                        for row in grid {
                            print(row)
                        }
                        print("\n")
                        // End
                    }
                }
                return false
            }
        }
    }
    return true
}

// // Error Xcode, use playgrounds to test
// solveSudoku(&grid)
