//
//  AchievementsView.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct AchievementsView: View {
    
    
    
    var body: some View {
        
        ZStack {
            
            Color("bg")
                .ignoresSafeArea()
            
            VStack {
            
                HStack {
                    
                    Text("Achievements")
                        .foregroundColor(.white)
                        .font(.system(size: 25, weight: .semibold))
                    
                    Spacer()
                }
                .padding()
                .padding(.bottom)
                
                ScrollView(.vertical, showsIndicators: true) {
                    
                    LazyVStack {
                        
                        Circle()
                            .stroke(.gray.opacity(0.15), lineWidth: 15)
                            .frame(width: 220, height: 220)
                            .overlay (
                            
                                VStack(spacing: 10, content: {
                                    
                                    Text("Your Rank")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                    
                                    Text("Soldier")
                                        .foregroundColor(.white)
                                        .font(.system(size: 19, weight: .semibold))
                                    
                                    Text("0%")
                                        .foregroundColor(.white)
                                        .font(.system(size: 18, weight: .medium))
                                        .padding(10)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                                })
                            )
                            .padding(.bottom)
                        
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], content: {
                            
                            ForEach([5000, 10000, 15000, 20000, 30000, 40000, 50000], id: \.self) { index in
                                
                                VStack(alignment: .leading, spacing: 20,  content: {
                                    
                                    Text("Have an income of $\(index)")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .medium))
                                    
                                    Text("Progress: 0%")
                                        .foregroundColor(.gray)
                                        .font(.system(size: 14, weight: .regular))
                                })
                                .padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 10).fill(.gray.opacity(0.1)))
                            }
                        })
                        .padding()
                    }
                    .padding(.top)
                }
            }
        }
    }
}

struct AchievementsView_Previews: PreviewProvider {
    static var previews: some View {
        AchievementsView()
    }
}
