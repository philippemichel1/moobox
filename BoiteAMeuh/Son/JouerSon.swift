//
//  JouerSon.swift
//  BoiteAMeuh
//
//  Created by Philippe MICHEL on 17/12/2020.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

// lecture du fichier son
func JouerSon(nomDuSon:String, typeSon:String) {
    if let path = Bundle.main.path(forResource: nomDuSon, ofType: typeSon) {
        do {
        audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
        audioPlayer?.play()
    } catch {
        print("probleme de lecture")
    }
        
    }
}

