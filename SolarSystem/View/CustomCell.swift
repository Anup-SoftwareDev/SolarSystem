//
//  CustomCell.swift
//  SolarSystem
//
//  Created by Anup Kuriakose on 2/11/2023.
//

import UIKit

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
