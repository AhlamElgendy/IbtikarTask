//
//  ViewController.swift
//  IbtikatTask
//
//  Created by Ahlam on 19/5/2021.
//

import UIKit
import RxSwift
import RxCocoa
import RxRelay

class ChannelsViewController: UIViewController {
  
    @IBOutlet weak var newEpisodeCollection:UICollectionView!
    @IBOutlet weak var channelTableView:UITableView!
    @IBOutlet weak var categoriesCollection:UICollectionView!
    let channelsVM :ChannelVM = dependencies.channelsVM
    
    @IBOutlet weak var channelTableViewHeight: NSLayoutConstraint!
    
    
    func registerNibs() {
        newEpisodeCollection.register(UINib(nibName: "NewEpisodeCollectionCell", bundle: nil), forCellWithReuseIdentifier: "NewEpisodeCollectionCell")
        //
        channelTableView.register(UINib(nibName: "ChannelTableViewCell", bundle: nil), forCellReuseIdentifier: "ChannelTableViewCell")
        //
        categoriesCollection.register(UINib(nibName: "CategoriesdCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CategoriesdCollectionViewCell")
       
    }
    
    func setDelegates(){
        newEpisodeCollection.rx.setDelegate(self)
        channelTableView.rx.setDelegate(self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibs()
        setDelegates()
        observeVS()
        channelsVM.getData()
        
    }
    
    func observeVS(){
        channelsVM.vs.map { (state)   in
            state.categories
        }.bind(to: self.categoriesCollection.rx.items(cellIdentifier: "CategoriesdCollectionViewCell", cellType: CategoriesdCollectionViewCell.self)) { row, data, cell in
            cell.bind(category: data)
        }
        channelsVM.vs.map { (state)   in
            state.channels
        }.bind(to: self.channelTableView.rx.items(cellIdentifier: "ChannelTableViewCell", cellType: ChannelTableViewCell.self)) { row, data, cell in
            cell.bind(channel: data)
        }
        
        channelsVM.vs.map { (state)   in
            state.newEpisodes
        }.bind(to: self.newEpisodeCollection.rx.items(cellIdentifier: "NewEpisodeCollectionCell", cellType: NewEpisodeCollectionCell.self)) { row, data, cell in
            cell.bind(media: data)
        }
            
        channelsVM.observeVS(handler:{ (vs) in
            if vs.loading {
                //show Loading
            }
            if vs.error != nil {
                //show Error
            }
            self.channelTableViewHeight.constant = CGFloat(450 * vs.channels.count)
            self.channelTableView.reloadData()
            

        })

    }


}


//extention :
extension ChannelsViewController:UICollectionViewDelegate,UICollectionViewDataSource{
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == newEpisodeCollection{
            return 5
        }else{
            return 10
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == newEpisodeCollection{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewEpisodeCollectionCell", for: indexPath) as! NewEpisodeCollectionCell
            
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriesdCollectionViewCell", for: indexPath) as! CategoriesdCollectionViewCell
            
            return cell
        }
           
            
    }
}

extension ChannelsViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChannelTableViewCell", for: indexPath) as! ChannelTableViewCell
        return cell
    }
    
    
    
    
}
