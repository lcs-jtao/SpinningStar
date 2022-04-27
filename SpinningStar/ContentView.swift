//
//  ContentView.swift
//  SpinningStar
//
//  Created by Joyce Tao on 2022-04-27.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: Stored properties
    
    // 1. Starting position for the star (initial state)
    @State var xOffset = -100.0
    
    // Control rotation of the star
    @State var starRotation = 0.0
    
    // Start a timer 0.25 seconds after the view appears
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    // MARK: Computed properties
    var body: some View {
        Image(systemName: "star")
            .resizable()
            .frame(width: 40, height: 40)
            .foregroundColor(.blue)
            .rotation3DEffect(Angle.degrees(starRotation), axis: (x: 0.0, y: 0.0, z: 1.0))
            .offset(x: xOffset, y: 0.0)
            .animation(
                Animation
                    .easeInOut(duration: 2)
                    .repeatForever(autoreverses: true)
            )
        // 3. Trigger the animation with a timer
            .onReceive(timer) { input in
                // 2. Logic that changes the state
                xOffset = 100.0
                // Spin the star twice
                starRotation = 360 * 2
                
                // Stop the timer
                timer.upstream.connect().cancel()
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
