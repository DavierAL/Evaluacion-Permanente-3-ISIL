//
//  Extension.swift
//  ep3Davier
//
//  Created by user213622 on 6/18/23.
//

import Foundation
import UIKit


extension UIImageView{
    
    func loadImage(from string: String){
        
        guard let  url = URL(string: string) else{
           print("Error_ invalid URL")
            return
        }
        //EJECUTANDO EN SEGUNDO PLANO:
        //creo una tarea q traera el contenido
        let task = URLSession.shared.dataTask(with: url) {
            (data, response,error) in
            //no me e podido conectar si sale error
            guard let data = data else {
                print("Error: not data found")
                return
            }
            //no pude traer la imagen si sale error
            guard let image = UIImage(data: data) else{
                print("Error: invalid data")
                return
            }
            //actualizo la vista, EN PRIMER PLANO ,POR ESO ASINCRONO
            DispatchQueue.main.async {
                self.image = image
            }
            
        }
        task.resume()

    }

}

    
   
