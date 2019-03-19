//
//  NowPlayingViewController.swift
//  lodevi
//
//  Created by apple on 28/10/18.
//  Copyright © 2018 apple. All rights reserved.
//

import UIKit
import AVFoundation

class NowPlayingViewController: UIViewController, UIScrollViewDelegate, AVAudioPlayerDelegate{

  
    @IBOutlet weak var coverImage: UIImageView!
    
    @IBOutlet weak var musicTitle: UILabel!
    
    @IBOutlet weak var artistName: UILabel!
    
    
    @IBOutlet weak var timeLeft: UILabel!
    
    @IBOutlet weak var timeRight: UILabel!
    
    @IBOutlet weak var previous: UIButton!
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var shuffle: UIButton!
    
    @IBOutlet weak var likesButton: UIButton!
    var player:AVAudioPlayer?
    var audioMusic: Audio?
    
    override func viewDidLoad() {
        super.viewDidLoad()
          print(audioMusic!.thumbnail)
          print(audioMusic!.music_url)
        let editImage   = UIImage(named: "shares")!
        let searchImage = UIImage(named: "plus")!
        let editButton   = UIBarButtonItem(image: editImage,  style: .plain, target: self, action: #selector(didTapEditButton))
        let searchButton = UIBarButtonItem(image: searchImage,  style: .plain, target: self, action: #selector(didTapSearchButton))
        navigationItem.rightBarButtonItems = [searchButton, editButton]
        let urlString = audioMusic!.music_url
        guard let URL = URL(string: urlString) else{
            return
        }
        do{
        
            let soundData = try? Data(contentsOf: URL)
            self.player = try AVAudioPlayer(data: soundData!)
            self.player?.prepareToPlay()
            player?.volume = 1.0
            player?.delegate = self
            player?.play()
        } catch{
            print(error.localizedDescription)
        }
    }
    
    func downloadFileFromURL(url: URL){
        var downloadTask:URLSessionDownloadTask
        downloadTask = URLSession.shared.downloadTask(with: url, completionHandler: { [weak self](URL:URL?, Response:URLResponse?,Error: Error?) -> Void in
            self?.play(url: URL! as NSURL)
        })
        downloadTask.resume()
    }
    func play(url:NSURL) {
        print("playing \(url)")
        
        do {
            self.player = try AVAudioPlayer(contentsOf: url as URL)
            player!.prepareToPlay()
            player!.volume = 1.0
            player!.play()
        } catch let error as NSError {
            //self.player = nil
            print(error.localizedDescription)
        } catch {
            print("AVAudioPlayer init failed")
        }
        
    }
    @objc func didTapEditButton(){
        print("Print Edit")
    }
    @objc func didTapSearchButton(){
        print("Print Search")
    }
}






























































