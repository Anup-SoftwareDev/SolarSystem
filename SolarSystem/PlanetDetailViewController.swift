//
//  PlanetDetailViewController.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 6/7/2023.
//

import UIKit

class PlanetDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var planetPicture: UIImageView!
    var planet: Planet?
    @IBOutlet weak var planetTable: UITableView!
    
    // Add your data here
    let data = [
        ["Mass", "0.93", "10^24 kg"],
        ["Diameter", "4879", "km"],
        ["Gravity", "3.7", "m/s^2"],
        ["Distance from Sun", "57.9", "10^6 km"],
        ["Mean Temp", "167", "C"],
        ["Day Length","0", "hours"],
        ["Orbital Period","0", "days"],
        ["Moons","0", "moon/s"]
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "\(planet!.name) Info"
        planetPicture.image = UIImage(named: planet!.name)
        planetPicture.contentMode = .scaleAspectFill
        planetPicture.layer.borderWidth = 6.0
        planetPicture.layer.borderColor = UIColor.white.cgColor
        planetPicture.layer.cornerRadius = planetPicture.frame.size.width * 0.05
        planetPicture.clipsToBounds = true
        
        planetTable.dataSource = self
        planetTable.delegate = self
    }
    
    // MARK: - UITableViewDataSource methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Add your data here
        let newdata = [
            ["Mass", String(planet!.mass), "10^24 kg"],
            ["Diameter", String(planet!.diameter), "km"],
            ["Gravity", String(planet!.gravity), "m/s^2"],
            ["Distance from Sun", String(planet!.distanceSun), "10^6 km"],
            ["Mean Temp", String(planet!.temperature), "C"],
            ["Day Length",String(planet!.dayLength), "hours"],
            ["Orbital Period",String(planet!.orbitalPeriod), "days"],
            ["Moons",String(planet!.moons), "moon/s"]
        ]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlanetDetailCell", for: indexPath)
        
        // Retrieve the data for this cell
        let cellData = newdata[indexPath.row]
        
        // Assuming you have three labels in the cell with tags 1, 2, and 3 respectively
        if let label1 = cell.viewWithTag(1) as? UILabel,
           let label2 = cell.viewWithTag(2) as? UILabel,
           let label3 = cell.viewWithTag(3) as? UILabel {
            label1.text = cellData[0]
            label1.layer.cornerRadius = label1.frame.height * 0.40
            label1.layer.masksToBounds = true
            label1.layer.borderColor = UIColor.white.cgColor
            label1.layer.borderWidth = 2
            
            label2.text = cellData[1]
            label2.layer.cornerRadius = label2.frame.height * 0.40
            label2.layer.masksToBounds = true
            label2.layer.borderColor = UIColor.white.cgColor
            label2.layer.borderWidth = 2
            
            label3.text = cellData[2]
            label3.layer.cornerRadius = label3.frame.height * 0.40
            label3.layer.masksToBounds = true
            label3.layer.borderColor = UIColor.white.cgColor
            label3.layer.borderWidth = 2
            
            if UIDevice.current.userInterfaceIdiom == .phone {
                // iPhone
                label1.font = UIFont(name: "Impact", size: 17)

                label1.translatesAutoresizingMaskIntoConstraints = false
                label1.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                label2.font = UIFont(name: "Impact", size: 17)

                label2.translatesAutoresizingMaskIntoConstraints = false
                label2.heightAnchor.constraint(equalToConstant: 30).isActive = true
                
                label3.font = UIFont(name: "Impact", size: 17)

                label3.translatesAutoresizingMaskIntoConstraints = false
                label3.heightAnchor.constraint(equalToConstant: 30).isActive = true
            } else if UIDevice.current.userInterfaceIdiom == .pad {
                // iPad
                label1.font = UIFont.systemFont(ofSize: 20)
            }

        }
        
        return cell
    }
}
//
//class PlanetDetailViewController: UIViewController {
//
//
//
//    @IBOutlet weak var planetPicture: UIImageView!
//
//    var planet: Planet? // Add this line to store the passed planet
//
//    @IBOutlet weak var planetTable: UITableView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        self.navigationItem.title = "\(planet!.name) Info"
//        // Set the image of planetPicture to Earth.jpg from assets
//        planetPicture.image = UIImage(named: planet!.name)
//        planetPicture.contentMode = .scaleAspectFill
//
//        // Add a thick white border to planetPicture
//        planetPicture.layer.borderWidth = 6.0 // The border width, adjust as necessary
//        planetPicture.layer.borderColor = UIColor.white.cgColor // The border color
//        planetPicture.layer.cornerRadius = planetPicture.frame.size.width * 0.05
//
//        // Set clipsToBounds to true to apply the corner radius to the image
//        planetPicture.clipsToBounds = true
//
//
//    }
//
//}
