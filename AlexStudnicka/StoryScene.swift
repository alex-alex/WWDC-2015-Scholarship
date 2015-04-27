//
//  StoryScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 19/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class StoryScene: SlidesScene {
	
	override func initSetup() {
		super.initSetup()
		
		// ----------------------------------------------------------------
		
		let slide1 = SCNNode()
		
		let imacScene = SCNScene(named: "story.scnassets/imac.dae")!
		let imacContainer = SCNNode()
		let imac = imacScene.rootNode.childNodeWithName("iMac", recursively: true)!
		imacContainer.addChildNode(imac)
		slide1.addChildNode(imacContainer)
		
		imacContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode = makeTextNode("   I got my first\nPC when I was 9")
		slide1.addChildNode(textNode)
		
		slides.append(slide1)
		
		rootNode.addChildNode(slide1)
		
		// ----------------------------------------------------------------
		
		let slide2 = SCNNode()
		
		let html5Scene = SCNScene(named: "story.scnassets/html5.dae")!
		let html5Container = SCNNode()
		let html5 = html5Scene.rootNode.childNodeWithName("HTML5", recursively: true)!
		html5Container.addChildNode(html5)
		slide2.addChildNode(html5Container)
		
		html5Container.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode2 = makeTextNode("I started programming\n webpages at age 10", size: 38)
		slide2.addChildNode(textNode2)
		
		slides.append(slide2)
		
		// ----------------------------------------------------------------
		
		let slide3 = SCNNode()
		
		let iphoneScene = SCNScene(named: "story.scnassets/iphone.dae")!
		let iphoneContainer = SCNNode()
		let iphone = iphoneScene.rootNode.childNodeWithName("iPhone", recursively: true)!
		iphoneContainer.addChildNode(iphone)
		slide3.addChildNode(iphoneContainer)
		
		iphoneContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode3 = makeTextNode("My first Apple product\n was iPhone, in 2008", size: 40)
		slide3.addChildNode(textNode3)
		
		slides.append(slide3)
		
		// ----------------------------------------------------------------
		
		let slide4 = SCNNode()
		
		let hammerScene = SCNScene(named: "story.scnassets/hammer.dae")!
		let hammerContainer = SCNNode()
		let hammer = hammerScene.rootNode.childNodeWithName("Hammer", recursively: true)!
		hammerContainer.addChildNode(hammer)
		slide4.addChildNode(hammerContainer)
		
		hammerContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode4 = makeTextNode("  Shortly after, I started\ndeveloping iPhone apps", size: 35)
		slide4.addChildNode(textNode4)
		
		slides.append(slide4)
		
	}
	
}
