import Foundation
import PlaygroundSupport
import UIKit
import SwiftUI
import AVFoundation

struct ContentView : View
{
    
    //For the sounds: 2 different players, one for background music, the other for the sounds effects
    @State var soundEffect : AVAudioPlayer!
    @State var backgroundMusic : AVAudioPlayer!
    
    //For decide witch audio to play and play it
    func startAudio(bGMusic1Door2Ghost3: Int) -> Void
    {   //check if all are valid
    //guard
            let musicURL = Bundle.main.url(forResource: "TipToes - Myuu", withExtension: "mp3")!
              let ghostAudioURL = Bundle.main.url(forResource: "scary_sound_copy copia",withExtension: "mp3")!
//        else {print("Can't find some audio file.")}
        
        switch bGMusic1Door2Ghost3
        {
        case 1: //background music
            do {
                backgroundMusic = try AVAudioPlayer(contentsOf: musicURL)
                backgroundMusic.numberOfLoops = 3
                backgroundMusic.play()
                backgroundMusic.setVolume(1, fadeDuration: 0)
            } catch { print("Something's wrong with the sound. Error: \(error)")}
            
        default: //ghost effect
            do {
                soundEffect = try AVAudioPlayer(contentsOf: ghostAudioURL)
                soundEffect?.numberOfLoops = 0
                soundEffect?.play()
                soundEffect?.setVolume(1, fadeDuration: 0)
            } catch { print("Something's wrong with the sound. Error: \(error)")}
        }
    }
    
    @State var tapCount = 0
    
    
    let ghostImg = UIImage(named: "Ghost")!
    let HappyGhostImg = UIImage(named: "HappyGhost")!
    
    let textArr =
    [
        "",
        "A little Ghost with few memories is going around in his first Halloween as a spirit.",
        "«Why are all these kids dressed up in very scary costumes?»",
        "«And they're getting so many candies for it...»",
        "«Oh right! It's Halloween!»",
        "«I'll go Trick or Treating as well then!»",
        "",
    ]
    
    func chooseProtagonist () -> UIImage
    {
        if tapCount < 4
        {
            return ghostImg
        } else
        {
            return HappyGhostImg
        }
    }
    
    func chooseProtagonistXposition() -> CGFloat
    {
        if tapCount == 0
        {
            //sta fuori inquadratura a sinistra
            return -50.0
        } else if (tapCount > 0 && tapCount < 5)
        {
            //sta in scena
            return 100.0}
        else
        {
            //fuori a destra
            return 450.0
        }
    }
    
    var body: some View
    {
        ZStack
        {
            Image(uiImage: UIImage(named: "Background")! )
            
            VStack
            {
                Image(uiImage: chooseProtagonist())
                    .padding(10)
                    .position(x: chooseProtagonistXposition(), y: 450)
                
                    .animation(Animation.easeInOut(duration: 2.0))
                
            }
            
            VStack
            {
                
                Text(tapCount == 0 ? """
                                         Chapter 1
                                         """  : "")
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(5.0)
                    .font(Font.system(size: 22, weight: .regular, design: .rounded))
                    .multilineTextAlignment(TextAlignment.center)
                
                Text(tapCount == 0 ? """
                                         A GHOST IN A
                                         SPOOKY NIGHT
                                         """  : "")
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(5.0)
                    .font(Font.system(size: 28, weight: .bold, design: .rounded))
                    .multilineTextAlignment(TextAlignment.center)
                
                    
            }
            .position(x: 200, y: 100)
            
                VStack
                {
                Spacer()
                HStack
                {
                    Spacer()
                    Text(tapCount < textArr.count ? textArr[tapCount] : "")
                        .padding(5)
                        .multilineTextAlignment(TextAlignment.center)
                        .font(Font.system(size: 20, weight: .medium, design: .rounded))
                        .foregroundColor(Color.orange)
                    Spacer()
                }
                
                HStack
                {
                    Spacer()
                    Button {
                        
                        if tapCount == 0 {
                            startAudio(bGMusic1Door2Ghost3: 1)
                        }
                        
                        if tapCount == 4 {
                            startAudio(bGMusic1Door2Ghost3: 2)
                        }
                            
                        tapCount += 1
                    } label:
                    {
                        Image(systemName: "chevron.right.circle.fill")
                            .foregroundColor(Color.orange)
                            .font(Font.system(size: 30.0))
                    }
                    .padding(10)
                }
            }
            
            
        }.frame(width: 400, height: 700)
        
        
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Chapter 2 ➡️](@next)

