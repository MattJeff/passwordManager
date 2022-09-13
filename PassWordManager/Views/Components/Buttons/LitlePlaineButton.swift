//
//  LitlePlaineButton.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 09/09/2022.
//

import SwiftUI

struct CustomButton: View {
    
    var size:ButtonSize
    var text:String = "Button".uppercased()
    var buttonType:ButtonStyle
    
    var  ButtonSize :CGFloat { switch size{
                
            case .large:
            return UIScreen.main.bounds.width/1.1
            case .medium:
            return UIScreen.main.bounds.width/1.8
                
            default:
            return UIScreen.main.bounds.width/2.38
        }
    }
    

    var body: some View {
        HStack{
        Text("\(text)").bold()
                .font(.custom("BebasNeue-Regular", size: 16))
               
             
        }.modifier(ButtonCustomStyle(size: ButtonSize, type: buttonType))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("Primary"),lineWidth: 2)
                    .frame(width: ButtonSize)
            )
            
            
    }
}

extension View {
    
 
}

