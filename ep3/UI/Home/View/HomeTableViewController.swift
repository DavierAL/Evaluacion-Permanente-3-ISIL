//
//  HomeTableViewController.swift
//  ep3
//
//  Created by user213622 on 6/17/23.
//

import UIKit


class HomeTableViewController: UITableViewController {
    
    lazy var viewModel = {
        HomeViewModelController()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
    }
    
    func initViewModel(){
        viewModel.getCategories()
        viewModel.reloadTableView = {
            DispatchQueue.main.sync {
                self.tableView.reloadData()
            }
        }
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.categoryViewModelCells.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeTableViewCell
        let vmCell = viewModel.getViewModelCell(at: indexPath)
        cell.homeViewModelCell = vmCell
      
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? HeroTableViewController else {
            return
        }
        guard let indexPath = self.tableView.indexPathForSelectedRow else {
            return
        }
        let viewModelCell = viewModel.getViewModelCell(at: indexPath)
        destination.name.text = viewModelCell.nameHeroe
        destination.heroeFullName.text = viewModelCell.biography.fullname
        destination.heroeImgPoster.loadImage(from: viewModel.heroeImgPoster.image.url)
        destination.categoryName = viewModelCell.name
    }

}
