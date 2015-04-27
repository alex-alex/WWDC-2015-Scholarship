//
//  OtherScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 20/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class OtherScene: SlidesScene {
	
	override func initSetup() {
		super.initSetup()
		
		// ----------------------------------------------------------------
		
		let slide1 = SCNNode()
		
		let clockScene = SCNScene(named: "other.scnassets/clock.dae")!
		let clockContainer = SCNNode()
		let clock = clockScene.rootNode.childNodeWithName("Clock", recursively: true)!
		clockContainer.addChildNode(clock)
		slide1.addChildNode(clockContainer)
		
		clockContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode = makeTextNode("This app was created\n    in a single week\n   by Alex Studnička", size: 32)
		slide1.addChildNode(textNode)
		
		slides.append(slide1)
		
		rootNode.addChildNode(slide1)
		
		// ----------------------------------------------------------------
		
		let slide2 = SCNNode()
		
		let planeContainer = SCNNode()
		
		let plane = SCNPlane(width: 200, height: 200)
		plane.firstMaterial!.doubleSided = true
		plane.firstMaterial!.diffuse.contents = UIImage(named: "scenekit-icon")
		let planeNode = SCNNode(geometry: plane)
		planeNode.position = SCNVector3(x: -40, y: 100, z: 100)
		planeContainer.addChildNode(planeNode)
		
		let plane2 = SCNPlane(width: 200, height: 200)
		plane2.firstMaterial!.doubleSided = true
		plane2.firstMaterial!.diffuse.contents = UIImage(named: "swift-icon")
		let planeNode2 = SCNNode(geometry: plane2)
		planeNode2.position = SCNVector3(x: 40, y: 100, z: -100)
		planeContainer.addChildNode(planeNode2)
		
		slide2.addChildNode(planeContainer)
		
		planeContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode2 = makeTextNode("Using SceneKit\n     and Swift")
		slide2.addChildNode(textNode2)
		
		slides.append(slide2)
		
		// ----------------------------------------------------------------
		
		let slide3 = SCNNode()
		
		let warehouseScene = SCNScene(named: "other.scnassets/3d-warehouse.dae")!
		let warehouseContainer = SCNNode()
		warehouseContainer.eulerAngles = SCNVector3(x: Float(M_PI/10), y: 0, z: 0)
		let warehouse = warehouseScene.rootNode.childNodeWithName("Warehouse", recursively: true)!
		warehouseContainer.addChildNode(warehouse)
		slide3.addChildNode(warehouseContainer)
		
		warehouseContainer.runAction(SCNAction.repeatActionForever(SCNAction.rotateByX(0, y: 1, z: 0, duration: ROTATION_DURATION)))
		
		let textNode3 = makeTextNode("   Royalty-free 3D models\n          are courtesy of\n3dwarehouse.sketchup.com", size: 30)
		slide3.addChildNode(textNode3)
		
		slides.append(slide3)
		
	}
	
}
