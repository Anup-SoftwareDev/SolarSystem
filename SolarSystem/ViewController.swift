//
//  ViewController.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 5/7/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    let planets = [
        //Planet(name: "Sun", image: "Sun", mass: 0.33, diameter: 4879, gravity: 3.7, distanceSun: 0, temperature: 167, dayLength: 0, moons: 0, orbitalPeriod: 0),
        Planet(name: "Mercury", image: "Mercury", mass: 0.33, diameter: 4879, gravity: 3.7, distanceSun: 57.9, temperature: 167, dayLength: 4222.6, moons: 0, orbitalPeriod: 88),
        Planet(name: "Venus", image: "Venus", mass: 4.87, diameter: 12104, gravity: 8.9, distanceSun: 108.2, temperature: 464, dayLength: 2802, moons: 0, orbitalPeriod: 224.7),
        Planet(name: "Earth", image: "Earth", mass: 5.97, diameter: 12756, gravity: 9.8, distanceSun: 149.6, temperature: 15, dayLength: 24, moons: 1, orbitalPeriod: 365.2),
        Planet(name: "Mars", image: "Mars", mass: 0.642, diameter: 6792, gravity: 3.7, distanceSun: 228, temperature: -65, dayLength: 24.7, moons: 2, orbitalPeriod: 687),
        Planet(name: "Jupiter", image: "Jupiter", mass: 1898, diameter: 142984, gravity: 23.1, distanceSun: 778.5, temperature: -110, dayLength: 9.9, moons: 92, orbitalPeriod: 4331),
        Planet(name: "Saturn", image: "Saturn", mass: 568, diameter: 120536, gravity: 9, distanceSun: 1432, temperature: -140, dayLength: 10.7, moons: 83, orbitalPeriod: 10747),
        Planet(name: "Uranus", image: "Uranus", mass: 86.8, diameter: 51118, gravity: 9, distanceSun: 2867, temperature: -195, dayLength: 17.2, moons: 27, orbitalPeriod: 30589),
        Planet(name: "Neptune", image: "Neptune", mass: 102, diameter: 49528, gravity: 8.7, distanceSun: 4515, temperature: -200, dayLength: 16.1, moons: 14, orbitalPeriod: 59800),
        Planet(name: "Pluto", image: "Pluto", mass: 0.0130, diameter: 2376, gravity: 0.7, distanceSun: 5906.4, temperature: -225, dayLength: 153, moons: 5, orbitalPeriod: 90560)
    ]
    
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
    return planets.count
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
    let planet = planets[indexPath.row]
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
            // Pass the selected planet to PlanetDetailViewController
            detailVC.planet = planets[indexPath.row]
            print(planets[indexPath.row].name)
            print("it is in prepare")
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        print("cell of \(planets[indexPath.row].name) is clicked")

        // Perform the segue
        performSegue(withIdentifier: "GoToPlanetDetail", sender: self)
        tableView.deselectRow(at: indexPath, animated: true)
        
        
    }

}

class CustomCell: UITableViewCell {
    
    let planetImage = UIImageView()
    let planetName = UILabel()
  
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(planetImage)
        addSubview(planetName)
        
        // Use Auto Layout to set the position of the planetImage and planetName
        planetImage.translatesAutoresizingMaskIntoConstraints = false
        planetName.translatesAutoresizingMaskIntoConstraints = false

        let imageDimension: CGFloat = 100
        NSLayoutConstraint.activate([
            planetImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 25),
            planetImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            planetImage.widthAnchor.constraint(equalToConstant: imageDimension),
            planetImage.heightAnchor.constraint(equalToConstant: imageDimension),

            planetName.leadingAnchor.constraint(equalTo: planetImage.trailingAnchor, constant: 30),
            planetName.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            planetName.widthAnchor.constraint(equalToConstant: 200),
            planetName.heightAnchor.constraint(equalToConstant: 50),
        ])

        // Change the font size and color of the planetName label
        planetName.font = UIFont(name: "ArialRoundedMTBold", size: 40)
        planetName.textColor = UIColor.white // Change the color as needed
        
        // Center the text vertically and horizontally
        planetName.textAlignment = .left

        // Round the corners of the planetImage
        planetImage.layer.cornerRadius = imageDimension * 0.20 // 5% of the width/height
        planetImage.clipsToBounds = true
        
        planetImage.layer.borderWidth = 2.0 // Set the thickness of the border
        planetImage.layer.borderColor = UIColor.white.cgColor // Set the color of the border
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


struct Planet {
    var name: String
    var image: String
    var mass: Double
    var diameter: Int
    var gravity: Double
    var distanceSun: Double
    var temperature: Int
    var dayLength: Double
    var moons: Int
    var orbitalPeriod: Double
}
