//
//  CeskeSMSScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 26/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class CeskeSMSScene: AppScene {
	
	override func initSetup() {
		super.initSetup()
		
		// ----------------------------------------------------------------
		
		let slide1 = SCNNode()
		
		let plane = SCNPlane(width: 640/4, height: 960/4)
		plane.firstMaterial!.diffuse.contents = UIImage(named: "CeskeSMSScreen")
		let planeNode = SCNNode(geometry: plane)
		planeNode.position.y += 130
		slide1.addChildNode(planeNode)
		
		let textNode1 = makeTextNode("   App for sending SMS\nin Czech republic for free", size: 32)
		slide1.addChildNode(textNode1)
		
		slides.append(slide1)
		
		rootNode.addChildNode(slide1)
		
		// ----------------------------------------------------------------
		
		let slide2 = SCNNode()
		
		let plane2 = SCNPlane(width: 235, height: 250)
		plane2.firstMaterial!.diffuse.contents = UIImage(named: "CeskeSMSTopPaid")
		let planeNode2 = SCNNode(geometry: plane2)
		planeNode2.position.y += 90
		slide2.addChildNode(planeNode2)
		
		let textNode2 = makeTextNode(" #1 Top Paid App\nin Czech republic\n   for first month", size: 32)
		slide2.addChildNode(textNode2)
		
		slides.append(slide2)
		
		// ----------------------------------------------------------------
		
		let slide3 = SCNNode()
		
		let plane3 = SCNPlane(width: 579/4, height: 819/4)
		plane3.firstMaterial!.diffuse.contents = UIImage(named: "CeskeSMSAppOfTheYear")
		let planeNode3 = SCNNode(geometry: plane3)
		planeNode3.position.y += 110
		slide3.addChildNode(planeNode3)
		
		let textNode3 = makeTextNode("   It won Czech\n\"App of the Year\"\n    user survey", size: 35)
		slide3.addChildNode(textNode3)
		
		slides.append(slide3)
		
	}
	
}
