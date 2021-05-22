//
//  ViewController.swift
//  IbtikatTask
//
//  Created by Ahlam on 19/5/2021.
//

import UIKit

class ChannelsViewController: UIViewController {
  
    @IBOutlet weak var newEpisodeCollection:UICollectionView!
    @IBOutlet weak var channelTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        newEpisodeCollection.register(UINib(nibName: "NewEpisodeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "NewEpisodeCollectionCell")
        newEpisodeCollection.delegate = self
        newEpisodeCollection.dataSource = self
        
        
        
        channelTableView.register(UINib(nibName: "ChannelTableViewCell", bundle: nil), forCellReuseIdentifier: "ChannelTableViewCell")
        channelTableView.delegate = self
        channelTableView.dataSource = self
        
        
        
    }


}


//extention :
extension ChannelsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      
            return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewEpisodeCollectionCell", for: indexPath) as! NewEpisodeCollectionCell
            
            return cell
            
    }
}

extension ChannelsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelTableViewCell", for: indexPath) as! ChannelTableViewCell
        
        return cell
    }
    
    
    
    
}
