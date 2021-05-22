//
//  CategoriesdCollectionViewCell.swift
//  IbtikatTask
//
//  Created by Ahlam on 21/5/2021.
//

import UIKit

class CategoriesdCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var categoryLbl:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func bind(category:CategoryItem){
        self.categoryLbl.text = category.name
    }

}
