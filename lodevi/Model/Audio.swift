//
//  Audio.swift
//  lodevi
//
//  Created by apple on 01/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class Audio{
    var id:Int = 0
    var title:String = ""
    var content:String = ""
    var music_url:String = ""
    var rates:Int = 0
    var views:Int = 0
    var thumbnail:String = ""
    var artistId:Int = 0
    var artistName:String = ""
    var artistThumbnail:String = ""
    var categoryId:Int = 0
    var categoryName:String = ""
    static func parseAudioJSONData(data: Data)->[Audio]{
        var audios = [Audio]()
        do{
            let result = try? JSONSerialization.jsonObject(with: data, options: [])
            if let jsonResult = result as? Dictionary<String, AnyObject>{
                if let _embedded = jsonResult["_embedded"] as? Dictionary<String, AnyObject>{
                    print(_embedded)
                    if let items = _embedded["items"] as? [Dictionary<String,AnyObject>]{
                        for item in items{
                            let newAudio = Audio()
                            newAudio.id = item["id"] as! Int
                            newAudio.title = item["title"] as! String
                            if let content = item["content"] as? String{
                                newAudio.content = content
                            }
                            if let _links = item["_links"] as? Dictionary<String, AnyObject>{
                                if let thumbnail = _links["thumbnail"] as? Dictionary<String, AnyObject>{
                                    print(thumbnail["href"] as! String)
                                    newAudio.artistThumbnail = thumbnail["href"] as! String
                                }
                            }
                            
                            newAudio.rates = item["rates"] as! Int
                            newAudio.views = item["views"] as! Int
                            if let _links = item["_links"] as? Dictionary<String, AnyObject>{
                                if let download = _links["download"] as? Dictionary<String, AnyObject>{
                                    newAudio.music_url = download["href"] as! String
                                    print("This is the download link \(download["href"] as! String)")
                                }
                            }
                            
                            if let _embbeded = item["_embedded"] as? Dictionary<String, AnyObject>{
                                
                                print("_embbeded :\(_embbeded)")
                                //parsing for authors
                                if let author = _embbeded["author"] as? Dictionary<String, AnyObject>{
                                
                                    newAudio.artistId = author["id"] as! Int
                                    newAudio.artistName = author["name"] as! String
                                    print("The author compositor name : \(author["name"] as! String)")
                                }
                                //parsing for categories
                                if let category = _embbeded["category"] as? Dictionary<String, AnyObject>{
                                    newAudio.categoryId = category["id"] as! Int
                                    newAudio.categoryName = category["name"] as! String
                                }
                            }
                            //parsing for Category
                            audios.append(newAudio)
                        }
                    }
                }
            }
        }catch let error{
            print(error.localizedDescription)
        }
        return audios
    }
}
