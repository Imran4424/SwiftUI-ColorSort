//
//  ContentView.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

struct GamePlayView: View {
    @State private var currentColor: MyColor?
    @State private var inititalPosition: CGPoint = .zero
    @State private var currentPosition: CGPoint = .zero
    
    @StateObject private var model = GameplayModel()
    
    let gridItems = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var drag: some Gesture {
        DragGesture()
            .onChanged { gestureValue in
                currentPosition = gestureValue.location
            }
            .onEnded { gestureValue in
                currentPosition = gestureValue.location
                
                withAnimation {
                    confirmWhereToyWasDropped()
                }
            }
    }
    
    var body: some View {
        ZStack {
            LazyVGrid(columns: gridItems, spacing: 20) {
                ForEach(model.myColorContainers, id: \.self) { myColor in
                    ColorContainerView(myColor: myColor, model: model)
                }
            }
            
            if let currentColor = currentColor {
                
            }
        }
    }
}

// MARK: - Game life cycle
extension GamePlayView {
    func confirmWhereToyWasDropped() {
        
    }
}

#Preview {
    GamePlayView()
}
