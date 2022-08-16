//
//  SoundsExample.swift
//  AdvancedTutorial
//
//  Created by Traian on 16.08.2022.
//

import SwiftUI
import AVKit

class SoundManager{
    static let instance = SoundManager()
    var player: AVAudioPlayer?
    
    func playSound(){
        guard let url = Bundle.main.url(forResource: "Tada-sound", withExtension: ".mp3") else{ return }
        
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()

        }catch{
            print("Error playing sound")
        }
    }
    
}


struct SoundsExample: View {
    var soundManager = SoundManager()
    var body: some View {
        VStack{
            CustomButton(title: "Play sound") {
                SoundManager.instance.playSound()
            }
        }
    }
}

struct SoundsExample_Previews: PreviewProvider {
    static var previews: some View {
        SoundsExample()
    }
}
