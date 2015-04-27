//
//  OpticsScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 26/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class OpticsScene: AppScene {
	
	override func initSetup() {
		super.initSetup()
		
		// ----------------------------------------------------------------
		
		let slide1 = SCNNode()
		
		let plane = SCNPlane(width: 640/5, height: 1136/5)
		plane.firstMaterial!.diffuse.contents = UIImage(named: "OpticsScreen")
		let planeNode = SCNNode(geometry: plane)
		planeNode.position.y += 125
		slide1.addChildNode(planeNode)
		
		let textNode = makeTextNode("  App I made as school project\nfor simulation of light refraction\n        in mirrors and lenses", size: 26)
		slide1.addChildNode(textNode)
		
		slides.append(slide1)
		
		rootNode.addChildNode(slide1)
		
	}
	
}
