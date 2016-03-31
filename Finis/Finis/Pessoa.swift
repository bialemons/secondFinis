//
//  Pessoa.swift
//  Finis
//
//  Created by Alline Pedreira on 31/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import Foundation

public class Pessoa {
    var nome: String!
    var email: String!
    var senha: String!
    
    public init(nome: String!, email:String!, senha:String!){
        self.nome = nome
        self.email = email
        self.senha = senha
    }


    public func atribui_nome (nome: String){
    self.nome = nome
    }
    
    public func atribui_email (email: String){
        self.email = email
    }
    
    public func atribui_senha (senha:String) {
        self.senha = senha
    }
    


}
