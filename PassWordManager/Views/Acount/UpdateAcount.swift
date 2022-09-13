//
//  UpdateAcount.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct UpdateAcount: View {
    @State var name:String = ""
    @State var URL:String=""
    @State var email:String=""
    @State var password:String=""
    
    var body: some View {
        ScrollView(showsIndicators:false){
        VStack(spacing:30){
            HStack{
            Image("Left")
                Spacer()
            }
            Text("Update")
                .modifier(Title())
            
     
                VStack(spacing:20){
                
                CustomTexField(text:$name, placeholder: "Website/App Name", textFiedlType: .standarField, title: "Username")
                    CustomTexField(text:$URL, placeholder: "Website / App Link", textFiedlType: .standarField, title: "Username")
                CustomTexField(text: $email, placeholder: "Email / Username", textFiedlType: .standarField, title: "Email")
                CustomTexField(text: $password, placeholder: "Password", textFiedlType: .secureField, title: "Password")
                
                    HStack{
                      
                    CustomButton(size: .small, text: "Generate New", buttonType: .strock)
                    }.padding()
                        .frame(width: screen.width/1.3, alignment: .trailing)
                   
                }
            
            Spacer()
            CustomButton(size: .large, text: "Save change", buttonType: .plain)
        }.padding()
        }
        
    }
}

struct UpdateAcount_Previews: PreviewProvider {
    static var previews: some View {
        UpdateAcount()
    }
}
