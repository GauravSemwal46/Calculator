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
                                .frame(width: getWidth(element: element), height: getHeight(element: element))
                                .background(element.buttonColor)
                                .cornerRadius(getWidth(element: element) / 2)
                                .shadow(color: .purple.opacity(0.8), radius: 30)
                        }
                    }
                }.padding(.bottom, 4)
            }
        }
        
    }
    
    func getWidth(element: Keys) -> CGFloat {
        if element == .zero {
            return (UIScreen.main.bounds.width - 50) / 2
        }
        return (UIScreen.main.bounds.width - 50) / 4
    }
    
    func getHeight(element: Keys) -> CGFloat {
        return (UIScreen.main.bounds.width - 50) / 5
    }
    
    func didTap(button: Keys) {
        switch button {
        case .add, .subtract, .multiply, .divide, .equal:
            if button == .add {
                self.currentOperation = .add
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .subtract {
                self.currentOperation = .subtract
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .multiply {
                self.currentOperation = .multiply
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .divide {
                self.currentOperation = .divide
                self.runningNumber = Int(self.value) ?? 0
            } else if button == .equal {
                let runningValue = self.runningNumber
                let currentValue = Int(self.value) ?? 0
                switch currentOperation {
                case .add:
                    self.value = "\(runningValue + currentValue)"
                case .subtract:
                    self.value = "\(runningValue - currentValue)"
                case .multiply:
                    self.value = "\(runningValue * currentValue)"
                case .divide:
                    self.value = "\(runningValue / currentValue)"
                case .none:
                    break
                }
            }
            if button != .equal {
                self.value = "0"
            }
        case .clear:
            self.value = "0"
        case .negative, .decimal, .percent:
            break
        default:
            let number = button.rawValue
            if self.value == "0" {
                self.value = number
            } else {
                self.value = "\(self.value)\(number)"
            }
        }
    }
}

#Preview {
    KeyView()
}
