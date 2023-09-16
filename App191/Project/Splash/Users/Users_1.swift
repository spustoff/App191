//
//  Users_1.swift
//  App191
//
//  Created by Вячеслав on 9/14/23.
//

import SwiftUI

struct Users_1: View {
    
    let telegram: URL
    let isContacts: Bool
    let isTelegram: Bool
    
    var body: some View {
        
        ZStack {
            
            Color("primary")
                .ignoresSafeArea()
            
            VStack {
                
                Image("users_1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Spacer()
            }
            
            VStack {
                
                Spacer()
                
                VStack {
                    
                    VStack(spacing: 7, content: {
                        
                        Text("Your success")
                            .foregroundColor(.white)
                            .font(.system(size: 23, weight: .semibold))
                            .multilineTextAlignment(.center)
                        
                        Text("Achieve big results")
                            .foregroundColor(.gray)
                            .font(.system(size: 14, weight: .regular))
                            .multilineTextAlignment(.center)
                    })
                    .padding(.horizontal)
                    .padding(.bottom, 130)
                    
                    NavigationLink(destination: {
                        
                        Users_2(telegram: telegram, isContacts: isContacts, isTelegram: isTelegram)
                            .navigationBarBackButtonHidden()
                        
                    }, label: {
                        
                        Text("Continue")
                            .foregroundColor(.white)
                            .font(.system(size: 15, weight: .medium))
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(RoundedRectangle(cornerRadius: 10).fill(Color("primary")))
                    })
                }
                .padding(.top)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color("bg").ignoresSafeArea())
            }
        }
    }
}

struct Users_1_Previews: PreviewProvider {
    static var previews: some View {
        Users_1(telegram: URL(string: "h")!, isContacts: false, isTelegram: false)
    }
}
