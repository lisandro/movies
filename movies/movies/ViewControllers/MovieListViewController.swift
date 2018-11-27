//
//  MovieListViewController.swift
//  movies
//
//  Created by Lisandro on 24/11/2018.
//  Copyright © 2018 Lisandro. All rights reserved.
//

import UIKit

class MovieListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

// MARK - UITableView
extension MovieListViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MovieTableViewCell = (tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell)!
//        cell.configure(with: fetchedResultsManager.movies[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "TODAS"
    }
}

// MARK: - Navigation
extension MovieListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        switch (segue.identifier ?? "") {
        case "ShowDetail":
            guard let mealDetailViewController = segue.destination as? MovieViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
//            guard let selectedMealCell = sender as? MealTableViewCell else {
//                fatalError("Unexpected sender: \(sender)")
//            }
//            
//            guard let indexPath = tableView.indexPath(for: selectedMealCell) else {
//                fatalError("The selected cell is not being displayed by the table")
//            }
//            
//            let selectedMeal = meals[indexPath.row]
//            mealDetailViewController.meal = selectedMeal
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier ?? "")")
        }
        
    }
}
