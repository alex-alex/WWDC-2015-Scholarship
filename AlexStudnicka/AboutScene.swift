//
//  AboutScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 18/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class AboutScene: SlidesScene {
	
	override func initSetup() {
		super.initSetup()
		
		// ----------------------------------------------------------------
		
		let slide1 = SCNNode()
		
		let manScene = SCNScene(named: "about.scnassets/man.dae")!
		let manContainer = SCNNode()
		let man = manScene.rootNode.childNodeWithName("Man", recursively: true)!
		manContainer.addChildNode(man)
		slide1.addChildNode(manContainer)
		
		manContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode = makeTextNode("   My name is\nAlex Studnička")
		slide1.addChildNode(textNode)
		
		slides.append(slide1)
		
		rootNode.addChildNode(slide1)
		
		// ----------------------------------------------------------------
		
		let slide2 = SCNNode()
		
		let calendarScene = SCNScene(named: "about.scnassets/calendar.dae")!
		let calendarContainer = SCNNode()
		let calendar = calendarScene.rootNode.childNodeWithName("Calendar", recursively: true)!
		calendar.position = SCNVector3(x: -20, y: 250, z: 0)
		calendarContainer.addChildNode(calendar)
		slide2.addChildNode(calendarContainer)
		
		calendarContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode2 = makeTextNode("I'm 19 years old")
		slide2.addChildNode(textNode2)
		
		slides.append(slide2)
		
		// ----------------------------------------------------------------
		
		let slide3 = SCNNode()
		
		let sphere = SCNSphere(radius: 100)
		sphere.firstMaterial!.diffuse.contents = UIImage(named: "earth.scnassets/earth-diffuse.jpg")
		sphere.firstMaterial!.normal.contents = UIImage(named: "earth.scnassets/earth-normal.jpg")
		sphere.firstMaterial!.reflective.contents = UIImage(named: "earth.scnassets/earth-reflective.jpg")
		sphere.firstMaterial!.specular.contents = UIImage(named: "earth.scnassets/earth-specular.jpg")

		let earthNode = SCNNode(geometry: sphere)
		earthNode.position = SCNVector3(x: 0, y: 120, z: 0)
		earthNode.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		slide3.addChildNode(earthNode)
		
		let pinScene = SCNScene(named: "about.scnassets/pin.dae")!
		let pinContainer = SCNNode()
		pinContainer.eulerAngles = SCNVector3(x: Float(140/(180/M_PI)), y: Float(195/(180/M_PI)), z: 0)
		let pin = pinScene.rootNode.childNodeWithName("Pin", recursively: true)!
		pinContainer.addChildNode(pin)
		earthNode.addChildNode(pinContainer)
		
		let textNode3 = makeTextNode("      I'm from\nCzech republic")
		slide3.addChildNode(textNode3)
		
		slides.append(slide3)
		
		// ----------------------------------------------------------------
		
		let slide4 = SCNNode()
		
		let watchScene = SCNScene(named: "about.scnassets/apple_watch.dae")!
		let watchContainer = SCNNode()
		let watch = watchScene.rootNode.childNodeWithName("Watch", recursively: true)!
		watch.position = SCNVector3(x: 350, y: 0, z: 0)
		watchContainer.addChildNode(watch)
		slide4.addChildNode(watchContainer)
		
		watchContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode4 = makeTextNode("I love technology\n   and gadgets")
		slide4.addChildNode(textNode4)
		
		slides.append(slide4)
		
		// ----------------------------------------------------------------
		
		let slide5 = SCNNode()
		
		let walleScene = SCNScene(named: "about.scnassets/wall-e.dae")!
		let walleContainer = SCNNode()
		let walle = walleScene.rootNode.childNodeWithName("WALL-E", recursively: true)!
		walleContainer.addChildNode(walle)
		slide5.addChildNode(walleContainer)
		
		walleContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode5 = makeTextNode("  Especially\nrobots and AI")
		slide5.addChildNode(textNode5)
		
		slides.append(slide5)
		
		// ----------------------------------------------------------------
		
		let slide6 = SCNNode()
		
		let drumkitScene = SCNScene(named: "about.scnassets/drum_kit.dae")!
		let drumkitContainer = SCNNode()
		let drumkit = drumkitScene.rootNode.childNodeWithName("DrumKit", recursively: true)!
		drumkitContainer.addChildNode(drumkit)
		slide6.addChildNode(drumkitContainer)
		
		drumkitContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode6 = makeTextNode("  I also love good\nmusic and movies", size: 45)
		slide6.addChildNode(textNode6)
		
		slides.append(slide6)
		
		// ----------------------------------------------------------------
		
		let slide7 = SCNNode()
		
		let racketScene = SCNScene(named: "about.scnassets/racket.dae")!
		let racketContainer = SCNNode()
		let racket = racketScene.rootNode.childNodeWithName("Racket", recursively: true)!
		racket.position = SCNVector3(x: -300, y: 100, z: 0)
		racketContainer.addChildNode(racket)
		slide7.addChildNode(racketContainer)
		
		racketContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode7 = makeTextNode("And some\nsports too")
		slide7.addChildNode(textNode7)
		
		slides.append(slide7)
		
	}

}
