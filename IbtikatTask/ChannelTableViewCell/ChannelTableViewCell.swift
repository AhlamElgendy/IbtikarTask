//
//  ChannelTableViewCell.swift
//  IbtikatTask
//
//  Created by Ahlam on 20/5/2021.
//

import UIKit

class ChannelTableViewCell: UITableViewCell {
    @IBOutlet weak var seriesCollection:UICollectionView!

    @IBOutlet weak var channelImg:UIImageView!
    @IBOutlet weak var seriesNameLbl:UILabel!
    @IBOutlet weak var episodeNumberLbl:UILabel!
    var latestMedia: [Media]?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        seriesCollection.delegate = self
        seriesCollection.dataSource = self
        seriesCollection.register(UINib(nibName: "NewEpisodeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "NewEpisodeCollectionCell")
        
        seriesCollection.register(UINib(nibName: "CourseDesignCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CourseDesignCollectionViewCell")
        //CourseDesignCollectionViewCell
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func bind(channel:Channel){
        self.seriesNameLbl.text = channel.title
        self.channelImg.kf.setImage(with: URL(string: channel.iconAsset?.thumbnailUrl ?? channel.iconAsset?.url ?? ""))
      
         if ((channel.series?.isEmpty) != true) {
            self.latestMedia = channel.series
            self.episodeNumberLbl.text = "\(channel.series!.count) Series"
        } else { self.latestMedia = channel.latestMedia
            
            self.episodeNumberLbl.text = "\(channel.mediaCount!) Episode"
        }
        seriesCollection.reloadData()
    }
    
}

extension ChannelTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.latestMedia?.count ?? 0
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if self.latestMedia?[indexPath.row].type == "course"{
            return CGSize(width: 200, height: 300)
        }else{
            return CGSize(width: 350, height: 250)
        }
        }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = self.latestMedia?[indexPath.row]
        if item?.type == "course"{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewEpisodeCollectionCell", for: indexPath) as! NewEpisodeCollectionCell
            cell.detailedTitle.isHidden = true
            cell.bind(media: item!)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CourseDesignCollectionViewCell", for: indexPath) as! CourseDesignCollectionViewCell
        cell.courseImg.kf.setImage(with: URL(string: item?.coverAsset?.url ?? ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    
      
        
        let stoaryboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = stoaryboard.instantiateViewController(withIdentifier: "DetailsViewController") as! DetailsViewController
        vc.media = latestMedia?[indexPath.row]
        self.window?.rootViewController?.present(vc, animated: true, completion: nil)
    }
    
    
}
