//
//  ViewController.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 5/7/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let viewModel = PlanetViewModel()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.addSubview(tableView)

            // Set Auto Layout constraints
            tableView.translatesAutoresizingMaskIntoConstraints = false
            let safeArea = view.safeAreaLayoutGuide
            NSLayoutConstraint.activate([
                tableView.topAnchor.constraint(equalTo: safeArea.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                tableView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor)
            ])

            tableView.dataSource = self
            tableView.delegate =  self
            tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
            tableView.rowHeight = 120
        
        // Make the table view transparent
        tableView.backgroundColor = UIColor.clear
    

    }
    
// Delegate method to set cell background color to clear
func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    cell.backgroundColor = UIColor.clear
}


func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
    return viewModel.planetCount
    
}

    
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
            let planet = viewModel.planet(at: indexPath.row)
            cell.planetImage.image = UIImage(named: planet.image)
            cell.planetName.text = planet.name
            return cell
        }

override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            print("Preparing for segue: \(segue.identifier ?? "No identifier")")
            print("Segue destination VC: \(segue.destination)")
            
            if let indexPath = tableView.indexPathForSelectedRow {
                print("Selected index path: \(indexPath)")
            } else {
                print("No row selected")
            }
        if segue.identifier == "GoToPlanetDetail",
           
           let detailVC = segue.destination as? PlanetDetailViewController,
           let indexPath = tableView.indexPathForSelectedRow {
       
            let selectedPlanet = viewModel.planets[indexPath.row]
            detailVC.viewModel = PlanetDetailViewModel(planet: selectedPlanet)
            print(selectedPlanet.name)
            print("it is in prepare")
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        print("cell of \(viewModel.planets[indexPath.row].name) is clicked")

        // Perform the segue
        performSegue(withIdentifier: "GoToPlanetDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

}



