//
//  ContentView.swift
//  task7
//
//  Created by Руслан Гайфуллин on 19.10.2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var animation
    @State private var isPresent = true
    
    var body: some View {
        VStack {
            if isPresent {
                Spacer()
                Button(action: {
                    withAnimation {
                        isPresent.toggle()
                    }
                }) {
                    Text("Open")
                        .frame(width: 100, height: 40)
                        .matchedGeometryEffect(id: "Text", in: animation)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .clipShape(RoundedRectangle(cornerRadius: 15.0), style: FillStyle())
                }
                .matchedGeometryEffect(id: "Button", in: animation)
                .position(x: 300, y: 650)
            } else {
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 20, style:
                            .circular)
                    .fill(.blue)
                    .matchedGeometryEffect(id: "Button", in: animation)
                    .frame(width: 350, height: 350)
                    
                    Button(action: {
                        withAnimation {
                            isPresent.toggle()
                        }
                    }, label: {
                        HStack {
                            Image(systemName: "arrowshape.backward.fill")
                            Text("Back")
                        }
                        .matchedGeometryEffect(id: "Text", in: animation, properties: .position)
                        .padding()
                        .foregroundStyle(.white)
                    })
                }
            }
        }
    }
}


#Preview {
    ContentView()
}
