//
//  DetailsViewController.swift
//  ep3Davier
//
//  Created by user213622 on 6/19/23.
//

import UIKit

class DetailsViewController: UIViewController {

    var heroeName: String?
    var items: [Heroe] = []
    
    @IBOutlet weak var poster: UIImageView!
    @IBOutlet weak var fullName: UILabel!
    
    @IBOutlet weak var placeOfBirth: UILabel!
    @IBOutlet weak var publisher: UILabel!
    @IBOutlet weak var alligment: UILabel!
    
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var race: UILabel!
    @IBOutlet weak var height: UILabel!
    @IBOutlet weak var weight: UILabel!
    
    @IBOutlet weak var occupation: UILabel!
    @IBOutlet weak var base: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        heroeName = "ironman"
        loadHeroeId()

        // Do any additional setup after loading the view.
    }
    
    func loadHeroeId() {
        guard let heroeName = heroeName else {
            print("Error: invalid heroe id")
            return
        }
        
        guard let url = URL(string: "https://superheroapi.com/api/10157703717092094/\(heroeName)") else {
            print("Error: Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
            guard let data = data else {
                print("Error: Invalid data")
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("Error: HTTP request failed")
                return
            }
            
            do {
                let heroeDetail = try JSONDecoder().decode(Heroe.self, from: data)
                self.heroeName = heroeDetail.name
                
                DispatchQueue.main.async {
                    self.fullName.text = heroeDetail.name
                    self.poster.loadImage(from: "https://www.superheroapi.com/api.php/10157703717092094/493/image")
                    self.poster.contentMode = .scaleAspectFill
                    self.placeOfBirth.text = heroeDetail.biography.placeOfBirth
                    self.publisher.text = heroeDetail.biography.publisher
                    self.alligment.text = heroeDetail.biography.alignment
                }
            } catch let error {
                print("Error: \(error)")
            }
        }
        task.resume()
    }

}
