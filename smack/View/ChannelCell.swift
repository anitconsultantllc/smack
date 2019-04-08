//
//  ChannelCell.swift
//  smack
//
//  Created by Whaylon Coleman on 4/7/19.
//  Copyright © 2019 AnITConsultant, LLC. All rights reserved.
//

import UIKit

class ChannelCell: UITableViewCell {
    @IBOutlet weak var channelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if selected{
            self.layer.backgroundColor = UIColor(white: 1, alpha: 0.2).cgColor
        }else{
            self.layer.backgroundColor = UIColor.clear.cgColor
        }
    }
    
    func configureCell(channel: Channel){
        let title = channel.channelTitle ?? ""
        if channelName.text != "#"{
            channelName.text = "#\(title)"
            channelName.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
            
            for id in MessageService.instance.unreadChannels {
                if id == channel.id {
                    channelName.font = UIFont(name: "HelveticaNeue-Bold", size: 22)
                }
            }
        }
    }

}
