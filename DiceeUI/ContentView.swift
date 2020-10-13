//
//  ContentView.swift
//  DiceeUI
//
//  Created by Juan Ramírez Blancas on 13/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 2
    var body: some View {
        ZStack {
                 ShakableViewRepresentable()
                    .allowsHitTesting(false)
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                
            VStack {
                Image("diceeLogo")
                Spacer()
                HStack {
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .padding(.horizontal)
                Spacer()
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                }, label: {
                    Text("Roll")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding()
                }).background(Color.red)
            }
            .onReceive(messagePublisher, perform: { _ in
                self.leftDiceNumber = Int.random(in: 1...6)
                self.rightDiceNumber = Int.random(in: 1...6)
            })
        }
    }
}


struct DiceView: View {
    let n: Int
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

