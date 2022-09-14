//
//  GenerateNiew.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 12/09/2022.
//

import SwiftUI

struct GenerateNiew: View {
    @State var password:String = "I#f4H4@g"
    @State var length = 8
    @State var Withsymbole = false
    @EnvironmentObject var manager:AccountManager
    @Environment(\.presentationMode) var presented
    var body: some View {
    
        VStack(spacing:30){
            HStack{
            Image("Left")
                    .onTapGesture {
                        presented.wrappedValue.dismiss()
                    }
                Spacer()
            }
            
            Text("Geberate Niew")
            
                .modifier(Title())
            HStack{
                Text(manager.passWord).padding()
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
                    
                    Text("\(length)").padding(10)
                        .font(.custom("Poppins", size: 16))
                    
                    Spacer()
                    Menu {
                        ForEach(8..<16) { val in
                            
                            Button {
                                length = val
                            } label: {
                                Text("\(val)")
                            }

                        }
                    } label: {
                        Image("Dropdown").padding(.trailing)
                    }

                 
                       
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
                    
                    Text(Withsymbole ? "YES" : "NO").padding(10)
                        .font(.custom("Poppins", size: 16))
                    Spacer()
                    Menu {
                        Button {
                            Withsymbole = true
                        } label: {
                            Text("YES")
                        }

                        Button {
                            Withsymbole = false
                        } label: {
                            Text("NO")
                        }

                      
                
                    } label: {
                        Image("Dropdown").padding(.trailing)
                    }
                       
                }
                
                .background(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("background"),lineWidth: 2)
                )
            }
            
            HStack(spacing:space2button){
                CustomButton(size: .small, text: "Randomize", buttonType: .strock)
                    .onTapGesture {
                        manager.generatePassword(length, Withsymbole)
                    }
                
                Button {
                    let pastBoard = UIPasteboard.general
                    if !manager.passWord.isEmpty {
                    pastBoard.string = manager.passWord
                    }
                    
                } label: {
                    
                    CustomButton(size: .small, text: "Copy", buttonType: .plain)
                    
                }

               
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
