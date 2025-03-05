//
//  KeyView.swift
//  Calculator
//
//  Created by Gaurav Semwal on 05/03/25.
//

import SwiftUI

struct KeyView: View {
    
    @State var value = "0"
    @State var runningNumber = 0
    @State var currentOperation: Operations = .none
    @State private var changeColor = false
    
    let buttons: [[Keys]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiply],
        [.four, .five, .six, .subtract],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal],
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                RoundedRectangle(cornerRadius: 30)
                    .frame(width: 350, height: 250, alignment: .center)
                    .foregroundColor(changeColor ? Color("Num").opacity(0.4) : Color.pink.opacity(0.2))
                    .scaleEffect(changeColor ? 1.5 : 1.0)
                    .animation(.easeInOut.speed(0.17)
                        .repeatForever(), value: changeColor)
                    .onAppear(perform: {
                        self.changeColor.toggle()
                    })
                    .overlay(
                        Text(value)
                            .font(.system(size: 100))
                            .bold()
                    )
            }.padding()
            ForEach(buttons, id: \.self) { row in
                HStack(spacing: 10) {
                    ForEach(row, id: \.self) { element in
                        Button {
                            self.didTap(button: element)
                        } label: {
                            Text(element.rawValue)
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                                .frame(width: 60, height: 60)
                                .background(element.buttonColor)
                                .cornerRadius(30)
                                .shadow(color: .purple.opacity(0.8), radius: 30)
                        }
                    }
                }.padding(.bottom, 4)
            }
        }
        
    }
    
    func didTap(button: Keys) {
        print("TODO: implement button click")
    }
}

#Preview {
    KeyView()
}
