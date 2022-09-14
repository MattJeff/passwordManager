//
//  Utiles.swift
//  PassWordManager
//
//  Created by Mathis Higuinen on 09/09/2022.
//

import Foundation
import SwiftUI

enum ButtonSize{
    
    case large
    case medium
    case small
    
}


enum ButtonStyle{
    
    case strock
    case plain
    
}


enum TexFieldType{
    
    case secureField
    case searchField
    case standarField
    
}


enum CreationError{
    
    case linkError
    case NameError
    case passwordError
    case emailError
    case noError
    
}



var space2button = UIScreen.main.bounds.width/2.38
var screen = UIScreen.main.bounds

