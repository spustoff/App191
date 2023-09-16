//
//  QuotesView.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct QuotesView: View {
    
    @StateObject var viewModel = SimulatorViewModel()
    
    @Environment(\.presentationMode) var router
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                ZStack {
                    
                    Text("Quotes")
                        .foregroundColor(.white)
                        .font(.system(size: 16, weight: .medium))
                    
                    HStack {
                        
                        Button(action: {
                            
                            router.wrappedValue.dismiss()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "chevron.left")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .medium))
                                
                                Text("Back")
                                    .foregroundColor(Color("primary"))
                                    .font(.system(size: 16, weight: .medium))
                            }
                        })
                        
                        Spacer()
                        
                    }
                }
                .padding()
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        ForEach(viewModel.currencies, id: \.self) { index in
                            
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
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

struct QuotesView_Previews: PreviewProvider {
    static var previews: some View {
        QuotesView()
    }
}
