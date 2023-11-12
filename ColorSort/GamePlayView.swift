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

                model.update(dragPosition: gestureValue.location, currentID: currentColor?.id)
            }
            .onEnded { gestureValue in
                currentPosition = gestureValue.location
                model.highlightedId = nil
                
                withAnimation {
                    if model.confirmWhereToyWasDropped(dragPosition: currentPosition, currentID: currentColor?.id) {
                        
                    } else {
                        currentPosition = inititalPosition
                    }
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
                        setInitialPosition(
                            to: CGPoint(
                                x: geometry.size.width * 0.5,
                                y: geometry.size.height * 0.9
                            )
                        )
                    }
                    .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                        // handling device orientation
                        // with a delay
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            setInitialPosition(
                                to: CGPoint(
                                    x: geometry.size.width * 0.5,
                                    y: geometry.size.height * 0.9
                                )
                            )
                        }
                    }
            }
        }
        .onAppear {
            setNextColor()
        }
    }
}

// MARK: - UI methods
extension GamePlayView {
    func setNextColor() {
        currentColor = model.myColors.popLast()
    }
    
    func setInitialPosition(to point: CGPoint) {
        inititalPosition = point
        currentPosition = inititalPosition
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
