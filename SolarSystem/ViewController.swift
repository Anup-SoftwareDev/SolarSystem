//
//  ViewController.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 5/7/2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    let planets = [
        Planet(name: "Sun", image: "Sun"),
        Planet(name: "Mercury", image: "Mercury"),
        Planet(name: "Venus", image: "Venus"),
        Planet(name: "Earth", image: "Earth"),
        Planet(name: "Mars", image: "Mars"),
        Planet(name: "Jupiter", image: "Jupiter"),
        Planet(name: "Saturn", image: "Saturn"),
        Planet(name: "Neptune", image: "Neptune"),
        Planet(name: "Pluto", image: "Pluto")
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
    
//        super.viewDidLoad()
//
//
//        view.addSubview(tableView)
//        tableView.frame = view.bounds
//        tableView.dataSource = self
//        tableView.delegate =  self
//        tableView.register(CustomCell.self, forCellReuseIdentifier: "cell")
//        tableView.rowHeight = 120
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

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    print("cell of \(planets[indexPath.row].name) is clicked")
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
        //planetName.font = UIFont.systemFont(ofSize: 35) // Change the number for a bigger or smaller font
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
}
