//
//  ContentView.swift
//  ColorSort
//
//  Created by Shah Md Imran Hossain on 11/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var currentColor: MyColor?
    @State private var inititalPosition: CGPoint = .zero
    @State private var currentPosition: CGPoint = .zero
    
    
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
        GeometryReader { geometry in
            
            
        }
    }
}

// MARK: - Game life cycle
extension ContentView {
    func confirmWhereToyWasDropped() {
        
    }
}

#Preview {
    ContentView()
}
