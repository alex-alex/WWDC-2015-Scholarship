//
//  WWDCScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 19/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class WWDCScene: SlidesScene {
	
	override func initSetup() {
		super.initSetup()
		
		// ----------------------------------------------------------------
		
		let slide1 = SCNNode()
		
		let mosconeScene = SCNScene(named: "wwdc.scnassets/moscone.dae")!
		let mosconeContainer = SCNNode()
		let moscone = mosconeScene.rootNode.childNodeWithName("Moscone", recursively: true)!
		mosconeContainer.addChildNode(moscone)
		slide1.addChildNode(mosconeContainer)
		
		mosconeContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode = makeTextNode("I've already been to\n  WWDC 2014 and\n    two Tech Talks", size: 40)
		slide1.addChildNode(textNode)
		
		slides.append(slide1)
		
		rootNode.addChildNode(slide1)
		
		// ----------------------------------------------------------------
		
		let slide2 = SCNNode()
		
		let logoScene = SCNScene(named: "wwdc.scnassets/apple-logo.dae")!
		let logoContainer = SCNNode()
		let logo = logoScene.rootNode.childNodeWithName("Logo", recursively: true)!
		logoContainer.addChildNode(logo)
		slide2.addChildNode(logoContainer)
		
		logoContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode2 = makeTextNode("I love the experience\n  of talking with real\n    Apple engineers", size: 40)
		slide2.addChildNode(textNode2)
		
		slides.append(slide2)
		
		// ----------------------------------------------------------------
		
		let slide3 = SCNNode()
		
		let capScene = SCNScene(named: "wwdc.scnassets/cap.dae")!
		let capContainer = SCNNode()
		let cap = capScene.rootNode.childNodeWithName("Cap", recursively: true)!
		capContainer.addChildNode(cap)
		slide3.addChildNode(capContainer)
		
		capContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode3 = makeTextNode("   And also other fellow\ndevelopers and students", size: 32)
		slide3.addChildNode(textNode3)
		
		slides.append(slide3)
		
	}
	
}
