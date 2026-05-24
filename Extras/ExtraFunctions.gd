extends Node


func Save_Data(data:Variant,file_name:String):
	var path :String= "user://"+file_name+"_EF.save"
	var file :Object= FileAccess.open(path, FileAccess.WRITE)
	file.store_var(data)
	file.close()

func Load_Data(data:Variant,file_name:String):
	var path :String= "user://"+file_name+"_EF.save"
	if FileAccess.file_exists(path):
		var file = FileAccess.open(path, FileAccess.READ)
		data = file.get_var()
		return data
	else:
		return data
		Save_Data(data,file_name)

func Execute_String(txt:String):
	var exp = Expression.new()
	exp.parse(txt)
	var result = exp.execute()
	return result

func Device_Type():
	if OS.has_feature("android"):return "android"
	elif OS.has_feature("ios"):return "ios"
	elif OS.has_feature("windows"):return "windows"
	elif OS.has_feature("linux"):return "linux"
	else:return OS.get_name()
