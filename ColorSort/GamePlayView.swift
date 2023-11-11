//
//  ContentView.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

struct GamePlayView: View {
    @State private var currentColor: MyColor? = MyColor.all.first!
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
                currentPosition = inititalPosition
                
                withAnimation {
                    // confirmWhereToyWasDropped()
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
            
            GeometryReader { geometry in
                if let currentColor = currentColor {
                    DraggableColorView(
                        myColor: currentColor,
                        position: currentPosition,
                        gesture: drag
                    )
                }
                
                Spacer()
                    .onAppear {
                        inititalPosition = CGPoint(
                            x: geometry.size.width * 0.5,
                            y: geometry.size.height * 0.9
                        )
                        
                        currentPosition = inititalPosition
                    }
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
