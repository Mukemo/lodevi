//
//  Artist.swift
//  lodevi
//
//  Created by apple on 02/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
struct Artist{
    var id: Int = 0
    var name: String = ""
    var description: String = ""
    var thumbnail: String = ""
    
    static func parseArtistJSONData(data: Data) -> [Artist]{
        var artists = [Artist]()
        do{
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: [])
            if let embbeds = jsonResult as? Dictionary<String, AnyObject> {
                //print("List")
                if let items2 = embbeds["_embedded"] as? Dictionary<String, AnyObject>{
                    print(items2)
                    if let itemsObject = items2["items"] as? [Dictionary<String, AnyObject>]{
                        for item in itemsObject{
                            var newArtist = Artist()
                            newArtist.description =  item["description"] as! String
                            newArtist.name = item["name"] as! String
                            newArtist.id = item["id"] as! Int
                            if let imagePath = item["_links"] as? Dictionary<String, AnyObject>{
                                if let imageLink = imagePath["thumbnail"] as? Dictionary<String, AnyObject>{
                                    if let link = imageLink["href"] as? String{
                                        newArtist.thumbnail = link
                                    }
                                }
                            }
                            artists.append(newArtist)
                        }
                    }
                }
            }
        }catch let error{
            print(error.localizedDescription)
        }
        return artists
    }
}
