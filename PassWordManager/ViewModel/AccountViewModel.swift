//
//  AccountViewModel.swift
//  PassWordManager
//
//  Created by s864226 on 13/09/2022.
//

import SwiftUI
import Security

class AccountManager:ObservableObject{
    
    @Published var accounts:[Account] = []
    @Published var passWord:String=""
    @Published var AppName:String=""
    @Published var AppLink:String=""
    @Published var Email:String=""
    @Published var icon:String?
    
    private var isSubmit = false
    
    func passWordIsValide()->CreationError{
        
        var  valeur:CreationError = .noError
        if isSubmit && !self.passWord.isEmpty {
            
            valeur = .passwordError
        }
    return valeur }
    
    func AppNameIsValide()->CreationError{
        var  valeur:CreationError = .noError
        if isSubmit && !self.AppName.isEmpty {
            
            valeur = .NameError
        }
    return valeur
    }
    
    
    func EmailIsValide()->CreationError{
        var  valeur:CreationError = .noError
        if isSubmit && !self.Email.isEmpty {
            
            valeur = .emailError
        }
    return valeur
    }
    
    func AppLinkIsValid()->CreationError{
        var  valeur:CreationError = .noError
        if isSubmit && !self.Email.isEmpty {
            
            valeur = .linkError
        }
    return valeur
    }
    
    
    
    
    
    func addAcount(){
    
        self.isSubmit = true
        
        let Email = EmailIsValide()
        let Name = AppNameIsValide()
        let Link = AppLinkIsValid()
        let PassWord = passWordIsValide()
        
        guard Email != .emailError else {return }
        guard Name != .NameError else {return }
        guard Link != .linkError else {return }
        guard PassWord != .passwordError   else {return }
        
        let account = Account(date: Date(), name: self.AppName, link: self.AppLink, email: self.Email, passWord: self.passWord)
        
        self.accounts.append(account)
        

    }
    
    
    
    
    func UpdateAccount(){
        
    }
    
    func deleteAccount(){
        
    }
    
    enum CreationError{
        
        case linkError
        case NameError
        case passwordError
        case emailError
        case noError
        
    }
    
    
    
    
    func generatePassword(_ length:Int,_ widthsymbole:Bool){
        
        var base = Array("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPKRSTUVWXYZ1234567890")
        let symbole = "$*€()!?:/+=&@"
        
        if widthsymbole {
            base += symbole
        }
        
        let rndPswd = String((0..<length).map{ _ in base[Int(arc4random_uniform(UInt32(base.count)))]})
        
        self.passWord = rndPswd
        

        
        
    }
    
}
