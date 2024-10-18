//
//  ContentView.swift
//  SudokuSolver-9x9-iOS
//
//  Created by Pratama One on 17/10/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var sudokuModel = SudokuModel()
    
    let initialClues: [(row: Int, col: Int, value: Int)] = [
            // Beberapa petunjuk acak untuk level sulit
            (0, 1, 1), (0, 2, 9), (0, 6, 8),
            (1, 1, 8), (1, 3, 7), (1, 4, 6), (1, 5, 9), (1, 8, 1),
            (2, 0, 7), (2, 6, 2), (2, 8, 9),
            (3, 1, 3), (3, 3, 4), (3, 5, 8), (3, 6, 7),
            (4, 0, 4), (4, 1, 7), (4, 2, 5), (4, 3, 1), (4, 5, 6), (4, 6, 3), (4, 7, 8), (4, 8, 2),
            (5, 2, 8), (5, 3, 3), (5, 5, 7), (5, 7, 5),
            (6, 0, 3), (6, 2, 4), (6, 8, 5),
            (7, 0, 9), (7, 3, 5), (7, 4, 7), (7, 5, 3), (7, 7, 2),
            (8, 2, 7), (8, 6, 6), (8, 7, 1)
        ]

    init() {
        for clue in initialClues {
            sudokuModel.grid[clue.row][clue.col] = String(clue.value)
        }
    }
    
    var body: some View {
        VStack {
            Text("SUDOKU BOARD [9 x 9]")
                .bold()
                .font(.title)
                .padding(.bottom, 30)
            
            ForEach(0..<9, id: \.self) { row in
                HStack {
                    ForEach(0..<9, id: \.self) { col in
                        TextField("", text: Binding(
                            get: { sudokuModel.grid[row][col] },
                            set: { newValue in
                                if newValue.isEmpty || newValue.count == 1 && "123456789".contains(newValue) {
                                    sudokuModel.grid[row][col] = newValue
                                }
                            }
                        ))
                            .frame(width: 35, height: 35)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            .border(Color.black, width: 1)
                    }
                }
            }
            
            Button("Solve Sudoku") {
                sudokuModel.solveWithBacktracking() // Jalankan algoritma backtracking
            }
            .padding()
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
