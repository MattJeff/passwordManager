//
//  GenerateNiew.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 12/09/2022.
//

import SwiftUI

struct GenerateNiew: View {
    @State var password:String = "I#f4H4@g"
    var body: some View {
    
        VStack(spacing:30){
            HStack{
            Image("Left")
                Spacer()
            }
            
            Text("Geberate Niew")
            
                .modifier(Title())
            HStack{
                Text(password).padding()
                    .font(.custom("Poppins", size: 16))
                    .frame(maxWidth: .infinity,maxHeight: 40)
            }.background(RoundedRectangle(cornerRadius: 10)
                .stroke(Color("background"),lineWidth: 2)
            )
            VStack(alignment:.leading){
                Text("Password length")
                    .font(.custom("BebasNeue-Regular", size: 12))
                    .padding(.leading,8)
                HStack{
                    
                    Text("8").padding(10)
                        .font(.custom("Poppins", size: 16))
                    Spacer()
                    Image("Dropdown").padding(.trailing)
                       
                }
                
                .background(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("background"),lineWidth: 2)
                )
            }
        
            VStack(alignment:.leading){
                Text("Password length")
                    .font(.custom("BebasNeue-Regular", size: 12))
                    .padding(.leading,8)
                HStack{
                    
                    Text("No").padding(10)
                        .font(.custom("Poppins", size: 16))
                    Spacer()
                    Image("Dropdown").padding(.trailing)
                       
                }
                
                .background(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("background"),lineWidth: 2)
                )
            }
            
            HStack(spacing:space2button){
                CustomButton(size: .small, text: "Randomize", buttonType: .strock)
                CustomButton(size: .small, text: "Copy", buttonType: .plain)
            }.padding(.horizontal)
            
        Spacer()
        }.padding()
            .foregroundColor(Color("Title"))
            
        
    }
}

struct GenerateNiew_Previews: PreviewProvider {
    static var previews: some View {
        GenerateNiew()
    }
}
