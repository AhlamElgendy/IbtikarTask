//
//  NewEpisodeCollectionCell.swift
//  IbtikatTask
//
//  Created by Ahlam on 20/5/2021.
//

import UIKit

class NewEpisodeCollectionCell: UICollectionViewCell {

    
    @IBOutlet weak var mainTitle:UILabel!
    @IBOutlet weak var detailedTitle:UILabel!
    @IBOutlet weak var episodeImg:UIImageView!


    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func bind(media:Media) {
        self.mainTitle.numberOfLines = 2
        self.mainTitle.text = media.title
        self.detailedTitle.text = media.channel?.title
        self.episodeImg.kf.setImage(with: URL(string: media.coverAsset?.url ?? ""))
    }

}
