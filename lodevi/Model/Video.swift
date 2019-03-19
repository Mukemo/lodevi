//
//  Video.swift
//  lodevi
//
//  Created by apple on 01/03/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class Video{
    var id:Int = 0
    var title:String = ""
    var content:String = ""
    var artistId:Int = 0
    var artistName:String = ""
    var thumbnail:String = ""
    var artistThumbnail:String = ""
    static func parseVideosJSONData(data:Data) -> [Video]{
        var videos = [Video]()
        do{
            let result = try? JSONSerialization.jsonObject(with: data, options: [])
            if let jsonResult = result as? Dictionary<String, AnyObject>{
                if let _embbeded = jsonResult["_embedded"] as? Dictionary<String, AnyObject>{
                    if let items = _embbeded["items"] as? [Dictionary<String,AnyObject>]{
                        for item in items{
                            let newVideo = Video()
                            newVideo.id = item["id"] as! Int
                            newVideo.title = item["title"] as! String
                            if let content = item["content"] as? String{
                                newVideo.content = content
                            }
                            if let links = item["_links"] as? Dictionary<String, AnyObject>{
                                print("The link is \(links)")
                                if let thumbail = links["thumbnail"] as? Dictionary<String,AnyObject>{
                                    print("The Thumbnail \(thumbail)")
                                    newVideo.thumbnail = thumbail["href"] as! String
                                }
                            }
                            if let _embbeded = item["_embedded"] as? Dictionary<String, AnyObject>{
                                if let author = _embbeded["author"] as? Dictionary<String,AnyObject>{
                                    newVideo.artistId = author["id"] as! Int
                                    newVideo.artistName = author["name"] as! String
                                }
                               
                            }
                            videos.append(newVideo)
                        }
                    }
                }
            }
            
        }catch let error{
            print(error.localizedDescription)
        }
        return videos
    }
}
