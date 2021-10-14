//: [⬅️ Chapter 2](@previous)

import Foundation
import PlaygroundSupport
import UIKit
import SwiftUI
import AVFoundation

struct ContentView : View
{
    @State var tapCount = 0
    @State var audioPlayer1:AVAudioPlayer?
    
    
    
    let ghostImg = UIImage(named: "Ghost")!
    let SadGhostImg = UIImage(named: "SadGhost")!
    let KidImg = UIImage(named: "Kid")!
    let KidGhostImg = UIImage(named: "KidGhost")!
    
    let textArr =
    [
        "",
        "The ghost feels alone and sad",
        "Until a kid comes to talk to him and the ghost explains his problem.",
        "«I can help out for the treat part,but i can't scare anyone when i need to do a trick» the kid says",
        "«I can help you out with that, if you want» , the ghost says",
        "The kid accepts and starts wearing his ghost costume",
        "So they begin their trick or treat journey together.",
    ]
    
    func startAudio1() {
        if let audioURL = Bundle.main.url(forResource: "TipToes",withExtension: "mp3") {
            do {
                
                try audioPlayer1 = AVAudioPlayer(contentsOf: audioURL)  //make audio player
                audioPlayer1?.numberOfLoops=0 //number of times to loop the  audio
                audioPlayer1?.play()
                audioPlayer1?.setVolume(1,fadeDuration: 0)
            } catch {
                print("Couldn't play audio.Error \(error)")
            }
            
        }
    }
    
    func Protagonists() -> (UIImage, UIImage, UIImage, UIImage) {
        
        return ( KidImg , KidGhostImg , SadGhostImg , ghostImg )
        
    }
    
    func chooseProtagonist1 () -> UIImage
    {
        if tapCount < 5
        {
            return KidImg
        } else {
            return KidGhostImg
        }
    }
    
    func chooseProtagonist2 () -> UIImage
    {
        if tapCount < 5
        {
            return SadGhostImg
            
        } else
        {
            return ghostImg
        }
    }
    
    func chooseProtagonist1Xposition() -> CGFloat
    {
        if tapCount < 2
        {
            //sta fuori inquadratura a sinistra
            return -100.0
        } else if (tapCount > 0 && tapCount < 6)
        {
            //sta in scena
            return 150.0}
        else
        {
            //fuori a destra
            return 500.0
        }
    }
    
    
    func chooseProtagonist2Xposition() -> CGFloat
    {
        if tapCount == 0
        {
            //sta fuori inquadratura a sinistra
            return -100.0
        } else if (tapCount > 0 && tapCount < 6)
        {
            //sta in scena
            return 300.0}
        else
        {
            //fuori a destra
            return 500.0
        }
    }
    
    
    var body: some View
    {
        ZStack
        {
            Image(uiImage: UIImage(named: "Background")! )
            
            VStack
            {
                Image(uiImage: chooseProtagonist1())
                    .padding(10)
                    .position(x: chooseProtagonist1Xposition(), y: 400)
                
                    .animation(Animation.easeInOut(duration: 2.0))
            }
            
            VStack
            {
                Image(uiImage: chooseProtagonist2())
                    .padding(10)
                    .position(x: chooseProtagonist2Xposition(), y: 420)
                
                    .animation(Animation.easeInOut(duration: 2.0))
            }
            
            VStack
            {
                
                Text(tapCount == 0 ? """
                                                         Chapter 3
                                                         """  : "")
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(5.0)
                    .font(Font.system(size: 22, weight: .regular, design: .rounded))
                    .multilineTextAlignment(TextAlignment.center)

                
                Text(tapCount == 0 ? """
                                                         A SCARY DUO
                                                         """  : "")
                    .foregroundColor(.black)
                    .background(Color.orange)
                    .cornerRadius(5.0)
                    .font(Font.system(size: 28, weight: .bold, design: .rounded))
                    .multilineTextAlignment(TextAlignment.center)
                
            }.position(x: 200, y: 80)
            
            VStack{
                
                Spacer()
                HStack
                {
                    Spacer()
                    Text(tapCount < textArr.count ? textArr[tapCount] : "")
                        .padding(5)
                        .font(Font.system(size: 20, weight: .medium, design: .rounded))
                        .multilineTextAlignment(TextAlignment.center)
                        .foregroundColor(Color.orange)
                    Spacer()
                }
                
                HStack
                {
                    Spacer()
                    Button {
                        if tapCount == 0 {
                            startAudio1()
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

//: [Chapter 4 ➡️](@next)

