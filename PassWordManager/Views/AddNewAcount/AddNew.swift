//
//  AddNew.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct AddNew: View {
    
    @State var name:String = ""
    @State var URL:String=""
    @State var email:String=""
    @State var password:String=""
    @EnvironmentObject var manager: AccountManager
    @Environment(\.presentationMode) var presented
    
    var body: some View {
        ScrollView(showsIndicators:false){
        VStack(spacing:30){
            HStack{
            Image("Left")
                    .onTapGesture {
                        presented.wrappedValue.dismiss()
                    }
                Spacer()
                
            }
            Text("Add New")
                .modifier(Title())
            
     
                VStack(spacing:20){
                
                    CustomTexField(text:$manager.AppName, placeholder: "Website/App Name", textFiedlType: .standarField, title: "Username")
                    CustomTexField(text:$manager.AppLink, placeholder: "Website / App Link", textFiedlType: .standarField, title: "Username")
                    CustomTexField(text: $manager.Email, placeholder: "Email / Username", textFiedlType: .standarField, title: "Email")
                    CustomTexField(text: $manager.passWord, placeholder: "Password", textFiedlType: .secureField, title: "Password")
                
                    HStack{
                      
                    CustomButton(size: .small, text: "Generate New", buttonType: .strock)
                    }.padding()
                        .frame(width: screen.width/1.3, alignment: .trailing)
                }
            
            Spacer()
            CustomButton(size: .large, text: "Add password", buttonType: .plain)
        }.padding()
        }
        
    }
}

struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
    }
}
