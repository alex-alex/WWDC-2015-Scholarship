//
//  CinemaCityScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 26/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class CinemaCityScene: AppScene {
	
	override func initSetup() {
		super.initSetup()
		
		// ----------------------------------------------------------------
		
		let slide1 = SCNNode()
		
		let plane = SCNPlane(width: 640/5, height: 1136/5)
		plane.firstMaterial!.diffuse.contents = UIImage(named: "CinemaCityScreen")
		let planeNode = SCNNode(geometry: plane)
		planeNode.position.y += 120
		slide1.addChildNode(planeNode)
		
		let textNode = makeTextNode("  App for largest\n   cinema chain\nin Czech republic", size: 38)
		textNode.position.y += 40
		slide1.addChildNode(textNode)
		
		slides.append(slide1)
		
		rootNode.addChildNode(slide1)
		
	}
	
}
