//
//  GameScene.swift
//  newGame
//
//  Created by Estefania  Yepez on 11/2/17.
//  Copyright © 2017 Estefania  Yepez. All rights reserved.
//

import SpriteKit
import GameplayKit
import CoreMotion

struct PhysicsCategory {
    static let None      : UInt32 = 0
    static let All       : UInt32 = UInt32.max
    static let Monster   : UInt32 = 0b1       // 1
    static let Projectile: UInt32 = 0b10      // 2
}


class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let player = SKSpriteNode(imageNamed: "player")
    let manager = CMMotionManager()
    
    var gamecontinue = 0
    
    override func didMove(to view: SKView) {
        if gamecontinue == 0{
            run(SKAction.repeatForever(
                SKAction.sequence([
                    SKAction.run(addMonster),SKAction.wait(forDuration:1.0)])))
        }
        else{
        }
        
        
        backgroundColor = SKColor.white
        //        here the position of the sprite to be 10 % across vertically and centered horizontally
        //      to make the sprite appear on the scene you must add it as a child of the scene
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.05)
        addChild(player)
        player.physicsBody = SKPhysicsBody(rectangleOf: player.texture!.size())
        
        if manager.isAccelerometerAvailable == true {
            print ("i got here")
            manager.startAccelerometerUpdates(to: OperationQueue(), withHandler:{
                data, error in
                
                self.physicsWorld.gravity = CGVector(dx: CGFloat((data?.acceleration.x)!)*10, dy: CGFloat((data?.acceleration.y)!)*10)
                
            })
            
        }
        
        physicsWorld.contactDelegate = self
    }
    
    func random() -> CGFloat{
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    func random(min: CGFloat, max: CGFloat) -> CGFloat{
        return random() * (max - min) + min
    }
    func addMonster(){
        //        here we create a sprite again with the name of the image
        let monster = SKSpriteNode(imageNamed: "monster")
        //        determine where to spawn the monster along the Y axis
        let actualY =  random(min: monster.size.height/2, max: size.height - monster.size.height/2)
        //        postiton the monster slightly off screen along the right edge, and along a random position along the Y axis as calculated above
        monster.position = CGPoint(x: size.width + monster.size.width/2, y:actualY)
        //        add the monster to the scece by adding it as a child
        addChild(monster)
        //        determine the speed of the monster
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        //        create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -monster.size.width/2, y:actualY), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    
    
    
    
}



