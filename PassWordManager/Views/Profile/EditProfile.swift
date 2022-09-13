//
//  EditProfile.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 11/09/2022.
//

import SwiftUI

struct EditProfile: View {
    
    @State var passWord:String=""
    @State var showLogin = false
    @State var isSubmit = false
    @Environment(\.presentationMode) var preseneted
    var size = UIScreen.main.bounds
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
      
                   
                Spacer()
              
            }
            VStack(alignment:.leading){
            Text("Edit profile").foregroundColor(Color("Title"))
                .font(.custom("BebasNeue-Regular", size: 64))
                .frame(maxWidth: .infinity, alignment: .leading)
               
              
            }
            }
            
            VStack{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Primary"),lineWidth: 2)
                    .background (
                        Image("avatar")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                    )
                    .frame(width: size.width/2.5, height: size.width/2.5)
               
                Text("Change picture")
                    .foregroundColor(Color("Primary"))
                    .font(.custom("Poppins", size: 14))
                
            }
            
        
                    CustomTexField(text: $passWord, placeholder: "New name", textFiedlType: .standarField, title: "Name")
                
                   
           Spacer()
            
            HStack(spacing:space2button){
                CustomButton(size: .small, text: "Cancel", buttonType: .strock)
                CustomButton(size: .small, text: "save", buttonType: .plain)
            }
        
        }.padding()
    }
}

struct EditProfile_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}
