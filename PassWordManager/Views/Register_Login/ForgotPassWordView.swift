//
//  ForgotPassWordView.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct ForgotPassWordView: View {
    
   
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
            Text("Forgot\nPassword").foregroundColor(Color("Title"))
                .font(.custom("BebasNeue-Regular", size: 64))
                .frame(maxWidth: .infinity, alignment: .leading)
                if isSubmit{
                Text("The link to reset your password has been sent to your email. Check your email to reset your password.")
                    .font(.custom("Poppins", size: 12))
                    .foregroundColor(.gray)
                }
              
            }
            }
            
            
            VStack(spacing:20){
           
                if isSubmit {
                    CustomButton(size: .large, text: "Resend", buttonType: .plain)
                }else{
                    CustomTexField(text: $email, placeholder: "Email", textFiedlType: .standarField, title: "Email")
                    CustomButton(size: .large, text: "Submit", buttonType: .plain)
                        .onTapGesture {
                            isSubmit = true
                        }
                }
               
               
            }
            
            
          
           
        
          
            
            Spacer()
        }.padding()
    }
}

struct ForgotPassWordView_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassWordView()
    }
}
