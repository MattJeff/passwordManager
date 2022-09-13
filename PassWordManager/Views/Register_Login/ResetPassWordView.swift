//
//  ResetPassWordView.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct ResetPassWordView: View {
    
     @State var email:String=""
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
                     .frame(width: 36, height: 36)
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
             Text("Reset\nPassword").foregroundColor(Color("Title"))
                 .font(.custom("BebasNeue-Regular", size: 64))
                 .frame(maxWidth: .infinity, alignment: .leading)
                
             }
             }
             
             
             VStack(spacing:20){
            
                     CustomTexField(text: $email, placeholder: "Email", textFiedlType: .secureField, title: "New Password")
                     CustomButton(size: .large, text: "Reset", buttonType: .plain)
                       
             }
             

             Spacer()
         }.padding()
     }
}

struct ResetPassWordView_Previews: PreviewProvider {
    static var previews: some View {
        ResetPassWordView()
    }
}
