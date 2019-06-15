//
//  ContentView.swift
//  CoreML SwiftUI
//
//  Created by Viswa Kodela on 6/15/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import SwiftUI

struct ContentView : View {
    
    @State private var wakeUp = Date()
    @State private var sleepAmount: Double = 8
    @State private var coffeeAmount: Int = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                    .lineLimit(nil) //for getting multiple lines
                
                DatePicker($wakeUp, displayedComponents: .hourAndMinute)
                
                Text("Desired amount of sleep")
                    .font(.headline)
                    .lineLimit(nil)
                Stepper(value: $sleepAmount, in: 4...12, step: 0.25) {
                    Text("\(sleepAmount, specifier: "%g") hours")
                }.padding(.bottom)
                
                Text("Daily Coffee intake")
                    .font(.headline)
                    .lineLimit(nil)
                Stepper(value: $coffeeAmount, in: 1...20, step: 1) {
                    if coffeeAmount == 1 {
                        Text("1 cup")
                    } else {
                        Text("\(coffeeAmount) cups")
                    }
                }.padding(.bottom)
                
                 Spacer()
            }
                .navigationBarItems(trailing:
                    Button(action: {
                        //Code here for calculate
                    }, label: {
                        Text("Calculate")
                            .font(.headline)
                    }))
                .navigationBarTitle(Text("Better Best"))
                .padding()
        }
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
