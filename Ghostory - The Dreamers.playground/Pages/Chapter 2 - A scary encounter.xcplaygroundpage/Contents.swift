//: [⬅️ Chapter 1](@previous)

import SwiftUI
import PlaygroundSupport
import UIKit
import Foundation
import AVFoundation
import CoreFoundation



struct ContentView: View {
    @State var tapCounter:Int=0
    @State var audioPlayer1:AVAudioPlayer?
    @State var audioPlayer2:AVAudioPlayer?
    @State var audioPlayer3:AVAudioPlayer?

    let textArr=[ //text of dialogues
        " ",
        "Trick or treat?",
        " ",
        "What are you?  How are you floating?",
        "I'm scared ,go away!! ",
        " ",
        "I just wanted candies.."
    ]
    let protagonist1=UIImage (named:"ghost1")!
    let protagonist2=UIImage (named:"ghost2")!
    //background after knock
    let background1=UIImage(named: "background1")!
    let background2=UIImage(named: "background2")!
    let background3=UIImage(named: "background3")!
    let background4=UIImage(named: "background4")!
    func startAudio1() {
        if let audioURL = Bundle.main.url(forResource: "door_knock",withExtension: "mp3") {
            do {
                
                try audioPlayer1 = AVAudioPlayer(contentsOf: audioURL)  //make audio player
                audioPlayer1?.numberOfLoops=0 //number of times to loop the  audio
                audioPlayer1?.play()
                audioPlayer1?.setVolume(1,fadeDuration: 0)
            } catch {
                print("Couldn't play audio.Error  \(error)")
                }/*else {
                    print("No audio file found ")
                } */
        
            }
    }
        func startAudio2() {
            if let audioURL = Bundle.main.url(forResource: "scary_sound",withExtension: "mp3") {
                do {
                    
                    try audioPlayer2 = AVAudioPlayer(contentsOf: audioURL)  //make audio player
                    audioPlayer2?.numberOfLoops=2 //number of times to loop the  audio
                    audioPlayer2?.play()
                    audioPlayer2?.setVolume(1,fadeDuration: 4)
                } catch {
                    print("Couldn't play audio.Error  \(error)")
                    }/*else {
                        print("No audio file found ")
                    } */
            
                }
        }
            func startAudio3() {
                if let audioURL = Bundle.main.url(forResource: "background_music",withExtension: "mp3") {
                    do {
                        
                        try audioPlayer3 = AVAudioPlayer(contentsOf: audioURL)  //make audio player
                        audioPlayer3?.numberOfLoops=0 //number of times to loop the  audio
                        audioPlayer3?.play()
                        audioPlayer3?.setVolume(1,fadeDuration: 4)
                    } catch {
                        print("Couldn't play audio.Error  \(error)")
                        }/*else {
                            print("No audio file found ")
                        } */
                
                    }
        }
    func background () -> UIImage { //return different background due to tapCoutner
        switch(tapCounter) {
        case 0...1:
            
            return background1
        case 2:
            return background2
        case 3:
            return background3
        
        case 4...5:
            return background4
        default:
            return background1
            
        }
    }
    

                        
     func protagonist_Xposition () -> CGFloat {
        if (tapCounter<2) {
            //fantasta si trova a sinisttra
            return 100
        }
        else if (tapCounter>=2 && tapCounter<6) {
            
            return 240
        }
        else   {
            return 1000
        }
    }
            
    func protagonist() ->UIImage {
        if (tapCounter<5) {
            return protagonist1
        }
        else {
            return protagonist2
        }
    }
    //let player = try! AVAudioPlayer(contentsOf: Bundle.main.url(forResource: "door_knock", withExtension: "mp3")!)
     //The "some audio" mp3 file is in Resources folder
    
    func startAudio() { //function that switchs automatically songs due to tapcounter
        switch (tapCounter) {
        case 1:
            startAudio1()
            startAudio3()
        case 2 :
            startAudio2()
        default :
            break
            
        }
        
        
        
    }
    var body: some View {
           
        ZStack {
            
            Image(uiImage: background())
            Image(uiImage:protagonist())
                .padding(10)
                .position( x: protagonist_Xposition(), y: 550)
                .animation(Animation.easeIn(duration: 2.5))
         //startAudio1()
           
           
                    VStack {
                        Spacer()
                        
                    Button(action: {
                        self.tapCounter += 1;
                        startAudio()
                        
                    })
                               {
                                   Image(systemName: "chevron.right.circle.fill")
                                        
                                       .foregroundColor(Color.orange)
                                       // Spacer()
                                   //.position(x:320,y:600 )
                                       .font(Font.system(size: 30.0))
                                       .padding(5)
                               }.offset(x:180)

                              /* Text("Button clicked : \(tapCounter) times")
                                  */
                   
                               //.padding(10)
                    }
                    HStack //Testo scritto basato sull'array
                    {
                        Text(tapCounter < textArr.count ? textArr[tapCounter] : " ")
                            .multilineTextAlignment(TextAlignment.center)
                            .foregroundColor(.orange)
                            .padding(5)
                            .font(Font.system(size: 20, weight: .medium, design: .rounded))
                            
                            
                            
                        Spacer()
                    }
      
                        VStack {
                                Text(tapCounter == 0 ? """
                                                     Chapter 2
                                                     """  : "")

                                    .foregroundColor(.black)
                                    .background(.orange)
                                    .font(Font.system(size: 22, weight: .regular,design: .rounded))
                                    .multilineTextAlignment(TextAlignment.center)
                                    .cornerRadius (5.0)
                            Text(tapCounter == 0 ? """
                                                     A SCARY ENCOUNTER
                                                     """  : "")

                                    .foregroundColor(.black)
                                    .background(.orange)
                                    .font(Font.system(size: 28, weight: .bold,design: .rounded ))
                                    .multilineTextAlignment(TextAlignment.center)
                                    .cornerRadius (5.0)

                            } .position(x: 200, y: 80)
           
            
            }.frame(width: 400,height: 700)
                }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Chapter 3 ➡️](@next)
