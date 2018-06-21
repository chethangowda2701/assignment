//
//  PLPCollectionViewCell.swift
//  SamsClub
//
//  Created by Gowda, Chethan S on 6/16/18.
//  Copyright © 2018 Gowda, Chethan S. All rights reserved.
//

import UIKit

class PLPCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var license: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setShadow()
    }
    
    public func setupWith(_ model: ProductViewModel, factor: Int) {
        self.name.text = model.name
        self.desc.text = model.description
        self.createdAt.text = model.createdAt
        self.license.text = model.license
        
        self.name.numberOfLines = self.name.numberOfLines * factor
        self.desc.numberOfLines = self.desc.numberOfLines * factor
        self.license.numberOfLines = self.license.numberOfLines * factor
        self.createdAt.numberOfLines = self.createdAt.numberOfLines * factor
    }

}
