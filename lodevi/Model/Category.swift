//
//  Category.swift
//  lodevi
//
//  Created by apple on 02/02/19.
//  Copyright © 2019 apple. All rights reserved.
//

import Foundation
class Category{
    var id:Int = 0
    var name:String = ""
    static func parseCategoryJSONData(data: Data)->[Category]{
        var categories = [Category]()
        do{
            let jsonResult = try? JSONSerialization.jsonObject(with: data, options: .allowFragments)
            if let categoriees = jsonResult as? [Dictionary<String, AnyObject>]{
                print(categories)
                for categ in categoriees{
                    let newCategory = Category()
                    newCategory.id = categ["id"] as! Int
                    newCategory.name = categ["name"] as! String
                    categories.append(newCategory)
                }
            }
        }catch let err{
            print(err.localizedDescription)
        }
        return categories
    }
}
