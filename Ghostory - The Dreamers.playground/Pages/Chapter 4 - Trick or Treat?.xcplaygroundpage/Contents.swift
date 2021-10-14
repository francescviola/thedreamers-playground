//: [⬅️ Chapter 3](@previous)

import UIKit
import Foundation
import SwiftUI
import PlaygroundSupport
import AVFoundation

struct ContentView : View
{
    @State var tapCount = 0
    
    //All captions
    let textArr =
    [
        "",
        "The ghost and the kid arrive to an house. Together they discuss about a strategy this time.",
        "«Let me do the talks and try to stay still on the ground. Then, if they don't have candies, let yourself go!» says the kid.",
        "«Count on me for that! I will scary them for sure» says the little spirit.",
        "So they knock on the door and the kid asks...",
        //5
        """
        «Trick or treat?»
        """,
        "The guy inside has no candies left, so the ghost starts to float all around, scaring with his spooky voice the poor man.",
        "The ghost is staying very still now and he is wispering. So the guy inside gives them some sweets and even compliments both for the costumes.",
        //8
        "«That was very cool!» says the duo. After doing other scary tricks and collecting candies at some other doors they share the sweet treasures.",
        "«Actually, I can't really eat them, you can keep all the candies. I just wanted to spend Halloween with a friend. I really enjoyed it with you!» says the ghost.",
        "«Same for me! Can I see you again?» asks the kid. «For sure the next Halloween! Meanwhile, if you're brave enough, you can find me in the cemetery at night!».",
        "So they promise to meet again, waving each other goodbye.",
        //12
        "The End"
    ]
    
    //All images
    let background = UIImage(named: "BG444")!
    let ghostBasket = UIImage(named: "GhostconBasket1")!
    let kidGhost = UIImage(named: "KidGhost1")!
    let ghostLookUp = UIImage(named: "GhostconBasket2")!
    let kidLookUp = UIImage(named: "KidGhost2")!
    let happyGhostLookUpBasket = UIImage(named: "GhostconBasket4")!
    let happyKidLookUpBasket = UIImage(named: "KidGhost4")!
    let ScaryGhost = UIImage(named: "GhostconBasket5")!
    let happyKidLookUp = UIImage(named: "KidGhost3")!
    let ghostCandy1 = UIImage(named: "GhostconCandy")!
    let kidCandy1 = UIImage(named: "KidGhostCandies")!
    let ghostCandy2 = UIImage(named: "GhostconCandy2")!
    let kidCandy2 = UIImage(named: "KidGhostCandies2")!
    let ghostCandy3 = UIImage(named: "GhostconCandy3")!
    let kidCandy3 = UIImage(named: "KidGhostCandy3")!

    //Select the two protagonist images displayed in the scenes
    func choosedProtagonist(ghostIs1ElseKid: Int) -> UIImage
    {
        switch tapCount
        {
        case 0...3:
            if ghostIs1ElseKid == 1
            {return ghostBasket} else {return kidGhost}
        case 4:
            if ghostIs1ElseKid == 1
            {return ghostLookUp} else {return kidLookUp}
        case 5:
            if ghostIs1ElseKid == 1
            {return happyGhostLookUpBasket} else {return happyKidLookUpBasket}
        case 6:
            if ghostIs1ElseKid == 1
            {return ScaryGhost} else {return happyKidLookUp}
        case 7:
            if ghostIs1ElseKid == 1
            {return ghostCandy1} else {return kidCandy1}
        case 9...10:
            if ghostIs1ElseKid == 1
            {return ghostCandy3} else {return kidCandy3}
        default:
            if ghostIs1ElseKid == 1
            {return ghostCandy2} else {return kidCandy2}
        }
    }
    
    //Select the x position of the two protagonist in the scenes
    func protagonistXposition (ghostIs1ElseKid: Int) -> CGFloat
    {
        switch tapCount
        {
        case 0:
            if ghostIs1ElseKid == 1
            {return -80} else {return -80}
        case 1...7:
            if ghostIs1ElseKid == 1
            {return 130} else {return 230}
        default:
            if ghostIs1ElseKid == 1
            {return 80} else {return 320}
        }
    }
    //For the sounds: 2 different players, one for background music, the other for the sounds effects
    @State var soundEffect : AVAudioPlayer!
    @State var backgroundMusic : AVAudioPlayer!
    
    //For decide witch audio to play and play it
    func startAudio(bGMusic1Door2Ghost3: Int) -> Void
    {   //check if all are valid
    //guard
        let musicURL = Bundle.main.url(forResource: "TipToes - Myuu", withExtension: "mp3")!
              let doorAudioURL = Bundle.main.url(forResource: "door_knock",withExtension: "mp3")!
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
            
        case 2: //door sound
            do {
                soundEffect = try AVAudioPlayer(contentsOf: doorAudioURL)
                soundEffect?.numberOfLoops = 0
                soundEffect?.play()
                soundEffect?.setVolume(1, fadeDuration: 0)
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
    
    var body: some View
    {
        ZStack
        {
            Image(uiImage: background)
            
            Image(uiImage: choosedProtagonist(ghostIs1ElseKid: 2))
                .position(x: protagonistXposition(ghostIs1ElseKid: 2), y: tapCount < 8 ? 350 : 390)
                .animation(Animation.easeInOut(duration: 2.0))
            
            Image(uiImage: choosedProtagonist(ghostIs1ElseKid: 1))
                .position(x: protagonistXposition(ghostIs1ElseKid: 1), y: tapCount == 6 ? 380 : 430)
                .animation(Animation.easeInOut(duration: 2.0))
                .scaleEffect(tapCount == 6 ? 1.8 : 1 ).animation(tapCount == 6 ? Animation.easeInOut.speed(0.4).repeatForever() : Animation.easeInOut.speed(1))
            
            VStack
            {
                //Title
                VStack {
                    Text(tapCount == 0 ? """
                                         Chapter 4
                                         """  : "")
                        .foregroundColor(.black)
                        .background(.orange)
                        .font(Font.system(size: 22, weight: .regular, design: .rounded))
                        .multilineTextAlignment(TextAlignment.center)
                        .cornerRadius(5.0)
                    
                    Text(tapCount == 0 ? """
                                         TRICK OR TREAT ?
                                         """  : "")
                        .foregroundColor(.black)
                        .background(.orange)
                        .font(Font.system(size: 28, weight: .bold, design: .rounded))
                        .multilineTextAlignment(TextAlignment.center)
                        .cornerRadius(5.0)
                }
                .position(x: 200, y: 80)
                Spacer()
                
                //Bottom text and buttons
                HStack
                {
                    Text(tapCount < textArr.count ? textArr[tapCount] : "The End")
                        .multilineTextAlignment(TextAlignment.center)
                        .foregroundColor(Color.orange)
                        .padding(5)
                        .font(Font.system(size: 20, weight: .medium, design: .rounded))
                    
                    Spacer()

                    if tapCount != 5
                    {
                        //Single button in all scenes exept 5
                        Button
                        {
                            if tapCount == 0
                            {startAudio(bGMusic1Door2Ghost3: 1)}
                            if tapCount == 3 {startAudio(bGMusic1Door2Ghost3: 2)}
                            if tapCount != 6
                            {tapCount += 1}
                            else
                                //Jump up 1 scene
                            {tapCount += 2}
                            
                        }
                    label:
                        {
                            Image(systemName: "chevron.right.circle.fill")
                                .foregroundColor(Color.orange)
                                .font(Font.system(size: 30.0))
                        }
                        .padding(5)
                    }
                    
                    else {
                        VStack {
                            
                            Button("Trick")
                            {
                                startAudio(bGMusic1Door2Ghost3: 3)
                                //Go to 6 (but then to 8)
                                tapCount += 1
                            }
                            .padding(5)
                            .foregroundColor(.black)
                            .background(.orange)
                            .font(Font.system(size: 22, weight: .medium))
                            .cornerRadius(10.0)
                            
                            Button("Treat")
                            {
                                //Go to 7 (then normally to 8)
                                tapCount += 2
                            }
                            .padding(5)
                            .foregroundColor(.black)
                            .background(.orange)
                            .font(Font.system(size: 22, weight: .medium))
                            .cornerRadius(10.0)
                        }
                    }
                }
            }
        }
        .frame(width: 400, height: 700)
    }
}


PlaygroundPage.current.setLiveView(ContentView())
