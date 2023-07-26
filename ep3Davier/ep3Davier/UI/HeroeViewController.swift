//
//  HeroeViewController.swift
//  ep3Davier
//
//  Created by user213622 on 6/18/23.
//

import UIKit

class HeroesViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    //table view
    @IBOutlet weak var tableViewHeroes: UITableView!
    //nombre para buscar
    @IBOutlet weak var txtName: UITextField!
    
    //inicializo arreglo de heroes
    var heroes = [Heroe]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewHeroes.delegate = self
        tableViewHeroes.dataSource = self
        tableViewHeroes.backgroundColor = UIColor.systemOrange
    }
    
    @IBAction func SearchButton(_ sender: Any) {
        guard let searchTextName = txtName.text else{
            print("Error: SearchText invalid")
            return
        }
        searchHeroes(searchTextName)
    }
    
    func searchHeroes(_ name: String){
            
         
       guard let url = URL(string: "https://www.superheroapi.com/api.php/10157703717092094/search/\(name)") else{
          return
       }
      //una tarea que nos va a traer datos
      let task = URLSession.shared.dataTask(with: url){ (data,response,error) in
          
         guard (error == nil) else {
            print("Error: \(error!)")
            return
         }
                
         guard let data = data else {
            print("Error: data not found")
            return
        }
                
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            print("Error: invalid response")
            return
        }
       
        do {
           let heroeWrapper = try  JSONDecoder().decode(HeroeWrapper.self, from: data)
           self.heroes = heroeWrapper.heroes
           //Ejecutando tarea en primer plano
           DispatchQueue.main.async {
               self.tableViewHeroes.reloadData()
           }
        } catch(let error){
          print("Error:\(error)")
         }
      }
    task.resume()
}


    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return heroes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroeTableViewCell
        let heroe = heroes[indexPath.row]
        cell.name.text = heroe.name
        cell.fullname.text = heroe.biography.fullname
        cell.imagen.loadImage(from: heroe.image.url)
        return cell
     }
    


}
