//
//  ContentView.swift
//  SpinningStar
//
//  Created by Joyce Tao on 2022-04-27.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // Starting position for the star (initial state)
    @State var xOffset = -100.0
    
    // MARK: Computed properties
    var body: some View {
        Image(systemName: "star")
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.blue)
            .offset(x: xOffset, y: 0)
            .animation(.default)
        // 3. Trigger the animation on a tap
            .onTapGesture {
                // 2. Logic that changes the state
                xOffset = 100.0
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
