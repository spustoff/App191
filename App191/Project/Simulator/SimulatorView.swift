//
//  SimulatorView.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct SimulatorView: View {
    
    @StateObject var viewModel = SimulatorViewModel()
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Simulator")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        VStack(alignment: .center, spacing: 10, content: {
                            
                            Text("Your Balance")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .regular))
                            
                            Text("$\(10000)")
                                .foregroundColor(.white)
                                .font(.system(size: 23, weight: .semibold))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                        
                        Text("Currencies")
                            .foregroundColor(.white)
                            .font(.system(size: 11, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 30)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
                            Button(action: {
                                
                                viewModel.isDetail = true
                                viewModel.current_currency = index
                                
                            }, label: {
                                
                                HStack {
                                    
                                    VStack(alignment: .leading, content: {
                                        
                                        Text(index)
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .medium))
                                        
                                        Text("Currency")
                                            .foregroundColor(.gray)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, content: {
                                        
                                        Text("$\(Int.random(in: 1...30000))")
                                            .foregroundColor(.white)
                                            .font(.system(size: 19, weight: .semibold))
                                        
                                        Text("+\(Int.random(in: 1...25))%")
                                            .foregroundColor(.green)
                                            .font(.system(size: 14, weight: .regular))
                                    })
                                }
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            })
                        }
                    }
                    .padding()
                }
            }
        }
        .sheet(isPresented: $viewModel.isDetail, content: {
            
            SimulatorDetail(pair: viewModel.current_currency)
        })
    }
}

struct SimulatorView_Previews: PreviewProvider {
    static var previews: some View {
        SimulatorView()
    }
}
