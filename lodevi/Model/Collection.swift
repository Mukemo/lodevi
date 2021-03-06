//
//  Collection.swift
//  lodevi
//
//  Created by apple on 19/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class Collection{
    var id:Int = 0
    var name:String = ""
    var size:Int = 0
    var year:Int = 0
    var imagThumb:String = ""
    var artistId:Int = 0
    var artistName: String = ""
    
    public static func parseCollectionJSONData(data: Data) -> [Collection]{
        var collections = [Collection]()
        do{
            let result = try? JSONSerialization.jsonObject(with: data, options: [])
            if let jsonResult = result as? Dictionary<String, AnyObject>{
                if let embbeds = jsonResult["_embedded"] as? Dictionary<String, AnyObject>{
                    //print(embbeds)
                    if let items = embbeds["items"] as? [Dictionary<String, AnyObject>]{
                        for item in items {
                            let newcollection = Collection()
                            newcollection.id = item["id"] as! Int
                            newcollection.name = item["name"] as! String
                            if let size =  item["size"] as? Int{
                                newcollection.size = size
                            }
                            newcollection.year = item["year"] as! Int
                            if let links = item["_links"] as? Dictionary<String,AnyObject>{
                                if let thumbnail = links["thumbnail"] as? Dictionary<String, AnyObject>{
                                    newcollection.imagThumb = thumbnail["href"] as! String
                                }
                            }
                            if let embbed1 = item["_embedded"] as? Dictionary<String, AnyObject> {
                                if let author = embbed1["author"] as? Dictionary<String, AnyObject>{
                                    print("Nemo")
                                   
                                    print("End nemo")
                                    //newcollection.artist?.description = author["description"] as! String
                                    //newcollection.artist?.name = author["name"] as! String
                                    newcollection.artistName = author["name"] as! String
                                    if let link1 = author["_links"] as? Dictionary<String, AnyObject> {
                                        if let thumbnail1 = link1["thumbnail"] as? Dictionary<String, AnyObject> {
//                                            newcollection.artist = newArtist
//                                            print(newArtist.getDescription())
//                                            print(newArtist.getId())
//                                            print(newArtist.getName())
//                                            print(newArtist.getThumbnail())
                                        }
                                    }
                                }
                            }
                            collections.append(newcollection)
                        }
                        print("end")
                    }
                }
            }
        }catch let error{
            print(error.localizedDescription)
        }
        return collections
    }
}
