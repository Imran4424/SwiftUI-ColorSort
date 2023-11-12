//
//  ContentView.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

// MARK: - Making own closure of delay
func runOnDelay(action: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
        action()
    }
}

struct GamePlayView: View {
    @State private var currentColor: MyColor?
    @State private var inititalPosition: CGPoint = .zero
    @State private var currentPosition: CGPoint = .zero
    
    @State private var score = 0
    @State private var draggableToyOpacity: CGFloat = 1.0
    
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
                model.update(dragPosition: gestureValue.location)
            }
            .onEnded { gestureValue in
                currentPosition = gestureValue.location
                
                withAnimation {
                    if model.confirmWhereToyWasDropped(dragPosition: currentPosition, currentID: currentColor?.id) {
                        score = score + 1
                        draggableToyOpacity = 0
                    } else {
                        model.highlightedId = nil
                        currentPosition = inititalPosition
                    }
                }
            }
    }
    
    var body: some View {
        NavigationStack {
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
                        .opacity(draggableToyOpacity)
                    }
                    
                    Spacer()
                        .onAppear {
                            runOnDelay {
                                setInitialPosition(
                                    to: CGPoint(
                                        x: geometry.size.width * 0.5,
                                        y: geometry.size.height * 0.9
                                    )
                                )
                            }
                        }
                        .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
                            // handling device orientation
                            // with a delay
                            runOnDelay {
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
            .onChange(of: score){ _, _ in
                setNextColor()
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Text("Score: \(score)")
                        .font(.largeTitle)
                }
            }
        }
    }
}

// MARK: - UI methods
extension GamePlayView {
    func setNextColor() {
        model.resetForNextRound()
        currentPosition = inititalPosition
        draggableToyOpacity = 1.0
        currentColor = model.myColors.popLast()
    }
    
    func setInitialPosition(to point: CGPoint) {
        inititalPosition = point
        currentPosition = inititalPosition
    }
}

// MARK: - Game life cycle
extension GamePlayView {
    
}

#Preview {
    GamePlayView()
}
