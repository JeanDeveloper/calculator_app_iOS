//
//  ContentView.swift
//  Calculator
//
//  Created by Jean Carlo Chunga Sandoval on 15/02/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            GeometryReader{ geometry in
                VStack{
                    VStack{
                        Spacer()
                        HStack{
                            Spacer()
                            Text(viewModel.textFieldValue)
                                .foregroundColor(.white)
                                .font(.system(size: 100, weight: .regular))
                                .frame(height:100)
                                .padding(.trailing, 20)
                        }
                        VerticalButtonStack(
                            viewModel: viewModel,
                            data: Matrix.firstSectionData,
                            columns: Matrix.firstSectionGrid( geometry.size.width * 0.25 ),
                            width: geometry.size.width
                        )

                        VerticalButtonStack(
                            viewModel: viewModel,
                            data: Matrix.secondSectionData,
                            columns: Matrix.secondSectionGrid( geometry.size.width * 0.25 ),
                            width: geometry.size.width
                        )
                    }
                }
            }
            .background(Color.black)
        }
    }
}

#Preview {
    ContentView()
}
