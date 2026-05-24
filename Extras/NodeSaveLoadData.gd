@icon("./NodeSaveLoadData.png")

class_name NodeSaveLoadData
extends Node

##Saves "Data" variable on your pc
@export var SaveData:bool=false
##Loads "Data" variable from your pc
@export var LoadData:bool=false
##Save and Load this variable
@export var Data:Variant
##WARNING if any other file in this project have exact same name , the save function will replace that file with this one.
@export var DataFileName:String


func _process(delta: float) -> void: if Data!=null:
	if SaveData:
		EF.Save_Data(Data,DataFileName+"_NodeSaveLoadData")
		SaveData=false
	if LoadData:
		Data=EF.Load_Data(Data,DataFileName+"_NodeSaveLoadData")
		LoadData=false
