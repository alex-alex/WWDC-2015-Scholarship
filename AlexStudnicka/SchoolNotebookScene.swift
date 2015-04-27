//
//  SchoolNotebookScene.swift
//  AlexStudnicka
//
//  Created by Alex Studnicka on 26/04/15.
//  Copyright (c) 2015 Alex Studnicka. All rights reserved.
//

import UIKit
import SceneKit

class SchoolNotebookScene: AppScene {
	
	override func initSetup() {
		super.initSetup()
		
		// ----------------------------------------------------------------
		
		let slide1 = SCNNode()
		
		let plane = SCNPlane(width: 640/4, height: 960/4)
		plane.firstMaterial!.diffuse.contents = UIImage(named: "MySchoolNotebookScreen")
		let planeNode = SCNNode(geometry: plane)
		planeNode.position.y += 130
		slide1.addChildNode(planeNode)
		
		let textNode = makeTextNode(" App for taking\nnotes in school", size: 44)
		slide1.addChildNode(textNode)
		
		slides.append(slide1)
		
		rootNode.addChildNode(slide1)
		
	}
	
}
