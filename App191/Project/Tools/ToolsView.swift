//
//  ToolsView.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct ToolsView: View {
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
                
                HStack {
                    
                    Text("Tools")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                    
                    NavigationLink(destination: {
                        
                        CalenderView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(spacing: 13, content: {
                            
                            Image("Holiday_Calendar")
                            
                            Text("Holiday Calendar")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    })
                    
                    NavigationLink(destination: {
                        
                        QuotesView()
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        VStack(spacing: 13, content: {
                            
                            Image("Quotes")
                            
                            Text("Quotes")
                                .foregroundColor(.white)
                                .font(.system(size: 15, weight: .medium))
                        })
                        .padding()
                        .frame(maxWidth: .infinity, alignment: .center)
                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                    })
                })
                .padding()
                
                Spacer()
            }
        }
    }
}

struct ToolsView_Previews: PreviewProvider {
    static var previews: some View {
        ToolsView()
    }
}
