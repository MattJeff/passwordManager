//
//  InformationView.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 10/09/2022.
//

import SwiftUI


struct CoreText: View {
    
    var text1:String
    var textColor:String
    var text2:String
    var desscription:String
    
    
    var body: some View {
        VStack(alignment:.leading){
         
            
                    Text(text1).foregroundColor(Color("Title"))
                        .font(.custom("BebasNeue-Regular", size: 64))
                Text(textColor)
                        .foregroundColor(Color("Primary"))
                            .font(.custom("BebasNeue-Regular", size: 64))
                Text(text2).foregroundColor(Color("Title"))
                        .font(.custom("BebasNeue-Regular", size: 64))
            
                
                Text(desscription)
                .foregroundColor(.gray)
                .font(.custom("Poppins-Regular", size: 12))
               
            
        }
    }
}

struct InformationView: View {
 
    @State var selected:Int
    
    var body: some View {
        VStack{
            HStack{
                Image("logo")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 36, height: 36)
                    .padding()
                Spacer()
              
            }
            Spacer()
            HStack{
                VStack{
                    if selected == 1 {
                        CoreText(text1: "Generate", textColor: "Secure", text2: "Password", desscription: "Stop using unsecure passwords for your online accounts, level up with OnePass. Get the most secure and difficult-to-crack passwords.")
                    }else if selected == 2 {
                        CoreText(text1: "All Your", textColor: "Password", text2: "Are Here", desscription: "Store and manage all of your passwords from one place. Don’t remember hundreds of passwords, just remember one.")
                    }else if selected == 3 {
                        CoreText(text1: "Don't type,", textColor: "Autofill", text2: "Your Credentials", desscription: "Don’t compromise your passwords by typing them in public, let OnePass autofill those and keep your credentials secure.")
                    }
          
                    
                }
                Spacer()
            }
            Spacer()
            HStack{
                ForEach(1..<4,id:\.self){ index in
                    
                    Number(index: index, indexSelected: $selected)
                        .onTapGesture {
                            selected = index
                        }
    
                }
            }.frame(maxWidth: .infinity,  alignment: .leading)
            Spacer()
            HStack(spacing:space2button){
                CustomButton(size: .small, text: "Register", buttonType: .strock)
                CustomButton(size: .small, text: "Login", buttonType: .plain)
            }
            
        }.padding()
    }
}

struct InformationView_Previews: PreviewProvider {
    static var previews: some View {
        InformationView(selected: 1)
    }
}

struct Number: View {
    
   
    var index:Int
    @Binding var indexSelected:Int
    
    var body: some View {
        Text("\(index)").font(.custom("BebasNeue-Regular", size: index == indexSelected ? 20 : 14))
            .foregroundColor( index == indexSelected ? Color("Primary"):.gray)
           
    }
}
