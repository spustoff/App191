//
//  SimulatorDetail.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct SimulatorDetail: View {
    
    @Environment(\.presentationMode) var router
    
    let pair: String
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack(alignment: .top) {
                    
                    VStack(alignment: .leading, spacing: 8, content: {
                        
                        Text(pair)
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                        
                        HStack(alignment: .bottom) {
                            
                            Text("$\(Int.random(in: 1...25555))")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                            
                            Text("+\(Int.random(in: 1...25))%")
                                .foregroundColor(.green)
                                .font(.system(size: 13, weight: .regular))
                        }
                    })
                    
                    Spacer()
                    
                    Button(action: {
                        
                        router.wrappedValue.dismiss()
                        
                    }, label: {
                        
                        Image(systemName: "xmark")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                            .padding(6)
                            .background(Circle().fill(.gray.opacity(0.2)))
                    })
                }
                .padding()
                .padding(.top)
                
                Chart(pair: pair)
                    .disabled(true)
            }
        }
    }
}

struct SimulatorDetail_Previews: PreviewProvider {
    static var previews: some View {
        SimulatorDetail(pair: "EURUSD")
    }
}
