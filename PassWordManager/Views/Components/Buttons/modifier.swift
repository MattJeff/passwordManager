//
//  modifier.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 09/09/2022.
//

import SwiftUI

struct ButtonCustomStyle: ViewModifier {

    var size:CGFloat
    var type:ButtonStyle = .plain
    
    func body(content: Content) -> some View {
        switch type {
            case .strock:
                content
                    .foregroundColor(Color("Primary"))
                    .padding(.vertical,8)
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("Primary"),lineWidth: 2)
                            .frame(width: size)
                        )
                       
                       
            default:
                content
                    .foregroundColor(.white)
                    .padding(.vertical,8)
                        .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color("Primary"))
                            .frame(width: size)
                        )
                       
        }
           
        }
  
}


struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(Color("Title"))
                .font(.custom("BebasNeue-Regular", size: 64))
                .frame(maxWidth: .infinity, alignment: .leading)
    }
}




struct TextFieldCustomStyle:ViewModifier{
    
    @Binding var placeholder:String
    @Binding var text:String
    @Binding  var show:Bool
    var action: ()->Void = {}
 
   var type:TexFieldType 
    
    func body(content: Content) -> some View {
        
        switch type {
            case .secureField:
                content
                    .overlay {
                        HStack{
                            
                            if show {
                                SecureField(placeholder, text: $text).padding(.horizontal)
                            }else{
                                TextField(placeholder,text:$text).padding(.horizontal)
                            }
                                
                           
                            Image(show ? "EyeOpen" : "EyeClose")
                                .renderingMode(.template)
                                .padding(.trailing)
                                .foregroundColor(Color("Primary"))
                                .onTapGesture {
                                    show.toggle()
                                }
                        }
                    }
            case .searchField:
                content
                    .overlay {
                        HStack{
                            Image("Search").padding(.leading)
                                .onTapGesture {
                                    (action ?? {})()
                                }
                            TextField(placeholder, text: $text).padding(.horizontal)
                            if !text.isEmpty {
                                Image("Delete").padding(.trailing)
                                    .onTapGesture {
                                        self.text = ""
                                    }
                            }
                        }
                    }
            default:
                content
                    .overlay {
                        HStack{
                            
                            TextField(placeholder, text: $text).padding(.horizontal)
                         
                        }
                    }
        }
     
    }
}

