@icon("./NodeSaveLoadData.png")

class_name NodeSaveLoadData
extends Node

##Save and Load this variable
@export var Data:Variant
##WARNING if any other file in this project have exact same name , the save function will replace that file with this one.
@export var DataFileName:String

##Saves Data
func Save():
	EF.Save_Data(Data,DataFileName+"_NodeSaveLoadData")

##Loads Data
func Load():
		Data=EF.Load_Data(Data,DataFileName+"_NodeSaveLoadData")
		return Data
