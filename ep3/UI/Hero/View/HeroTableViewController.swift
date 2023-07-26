//
//  HeroTableViewController.swift
//  ep3
//
//  Created by user213622 on 6/17/23.
//

import UIKit

class HeroTableViewController: UITableViewController {

    var name: String?
    var heroeFullName: String?
    var heroeImgPoster: String?
    
    var heros = Heros()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadHeroes()

    }
    
    func loadHeroes(){
        
        guard let heroeName = name else {
            print("Error: Heroe not found")
            return
        }

        let url = "https://www.superheroapi.com/api.php/10157703717092094/search/hero"
        
        HeroService().getHero(url: url) { success, data, error in
            if success {
                self.heros = data!
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                print(error!)
            }
        }
    }
    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return heros.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let heros = heros[indexPath.row]
        cell.textLabel?.text = heros.name
        cell.textLabel?.textColor = UIColor.white
        

        // Configure the cell...

        return cell
    }
}
