//
//  BancoDeDados.swift
//  Finis
//
//  Created by Alline Pedreira on 31/03/16.
//  Copyright © 2016 Alline Pedreira. All rights reserved.
//

import Foundation

internal var separator = " &&"

public func carregarBaseDados() {
    carregarUsuarios()
}

internal func carregarUsuarios () {
    let file = "usuarios.txt"
    
    if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
        let path = dir.stringByAppendingPathComponent(file)
        
        //reading
        do {
            let text = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding)
            print (path)
            // transforma o texto lido em um array de strings separando-o pelas virgulas
            let textAsArray = text.componentsSeparatedByString(separator)
            //print (textAsArray)
            
            print ("Li do arquivo \(file) a string:\n\(text)")
            
            // pega cada usuario do array e adiciona na listaPessoas (global)
            let totalUsuarios = textAsArray.count / 3
            for i in 0..<totalUsuarios {
                // o indice do email eh o do nome+1
                // o indice da senha eh o do nome+2
                // multiplica por 3 porque sao 3 parametros pra cada usuario
                let indiceNome = i*3
                listaPessoas.append(Pessoa(nome: textAsArray[indiceNome] , email: textAsArray[indiceNome+1], senha: textAsArray[indiceNome+2]))
            }
        } catch {
            print ("erro na leitura do arquivo \(file)")
        }
    }
}

// salva um usuario no formato "nome&&email&&senha&&"
public func salvarUsuario (usuario: Pessoa) {
    let file = "usuarios.txt"
    
    if let dir : NSString = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.AllDomainsMask, true).first {
        let path = dir.stringByAppendingPathComponent(file)
        
        var textoAntesDoSave = ""
        
        //reading
        do {
            textoAntesDoSave = try NSString(contentsOfFile: path, encoding: NSUTF8StringEncoding) as String
        } catch {
            print ("erro na leitura do arquivo \(file)")
        }
        
        //writing
        do {
            var usuarioAsString = textoAntesDoSave
            usuarioAsString += "\(usuario.nome)\(separator)\(usuario.email)\(separator)\(usuario.senha)\(separator)"
            
            try usuarioAsString.writeToFile(path, atomically: false, encoding: NSUTF8StringEncoding)
            print ("Escrevi no arquivo \(file) a string:\n\(usuarioAsString)")
        } catch {
            print ("erro na escrita do arquivo \(file)")
        }
    }
}
