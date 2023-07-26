//
//  HomeViewModelController.swift
//  ep3
//
//  Created by user213622 on 6/17/23.
//

import Foundation

class HomeViewModelController {
    
    var name: String?
    var heroeFullName: String?
    var heroeImgPoster: String?
    
    private let url = "https://www.superheroapi.com/api.php/10157703717092094/search/hero"
    private var homeService: HomeServiceProtocol
    
    var heroes = Heroes()
    
    var reloadTableView: (() -> Void)?
    
    var categoryViewModelCells = [HomeCellViewModel]() {
        didSet {
            reloadTableView?()
        }
    }
    
    init (homeService: HomeServiceProtocol = HomeServices()){
        self.homeService = homeService
    }
    
    func getCategories() {
        homeService.getCategories(url: url) { success, data, error in
            if success, let heroes = data {
                self.fetchData(heroes: heroes)
            } else {
                print(error!)
            }
        }
    }
    
    func fetchData(heroes: Heroes) {
        self.heroes = heroes
        var vmd = [HomeCellViewModel]()
        for category in heroes {
            vmd.append(HomeCellViewModel(nameHeroe: category.name, posterUrl: <#T##String#>))
        }
        categoryViewModelCells = vmd
    }
    
    func getViewModelCell(at indexPath: IndexPath) -> HomeCellViewModel {
        return categoryViewModelCells[indexPath.row]
    }
    
    func getViewModelCellCount() -> Int {
        return categoryViewModelCells.count
    }
    
}
