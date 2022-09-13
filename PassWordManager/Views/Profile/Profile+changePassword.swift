//
//  Profile+changePassword.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct Profile_changePassword: View {
    
     @State var passWord:String=""
     @State var showLogin = false
     @State var isSubmit = false
     @Environment(\.presentationMode) var preseneted
     
     var body: some View {
         VStack(spacing:32){
             VStack{
             HStack{
                 Image("Left")
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 32, height: 32)
                     .onTapGesture {
                         preseneted.wrappedValue.dismiss()
                     }
                 Image("logo")
                     .resizable()
                     .aspectRatio(contentMode: .fill)
                     .frame(width: 36, height: 36)
                    
                 Spacer()
               
             }
             VStack(alignment:.leading){
             Text("Change\nPassword").foregroundColor(Color("Title"))
                 .font(.custom("BebasNeue-Regular", size: 64))
                 .frame(maxWidth: .infinity, alignment: .leading)
                
               
             }
             }
             
             VStack(spacing:20){
            
            
                     CustomTexField(text: $passWord, placeholder: "New Password", textFiedlType: .secureField, title: "New password")
                 
                            CustomTexField(text: $passWord, placeholder: "Confirm New Password", textFiedlType: .secureField, title: "New Password")
                     CustomButton(size: .large, text: "Change password", buttonType: .plain)
                         .onTapGesture {
                           
                         }

             }
            
             
             Spacer()
         }.padding()
     }
}

struct Profile_changePassword_Previews: PreviewProvider {
    static var previews: some View {
        Profile_changePassword()
    }
}
