//
//  StandarTexField.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 10/09/2022.
//

import SwiftUI

struct CustomTexField: View {
    
    @Binding var text:String
    @State var action: () -> Void = {}
    @State var placeholder:String
    @State var erreur = false
    @State var show = true
    var size = UIScreen.main.bounds
    var textFiedlType:TexFieldType
    var title:String?
    
    var body: some View {
      
        HStack{
   
            VStack(alignment:.leading){
                Text(title ?? "")
                    .font(.custom("BebasNeue-Regular", size: 10)).padding(.leading,8)
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(erreur ?  "Primary" : "background"),lineWidth: 2)
                .frame(width: size.width/1.1 ,height: 40)
                .modifier(TextFieldCustomStyle(placeholder: $placeholder, text: $text, show: $show, action:{}, type: textFiedlType))
            }
            
        }
      

    }
}

