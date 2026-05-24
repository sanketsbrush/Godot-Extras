**Extras**  

This Godot addon provides extra custom nodes that autosave data when changes occur and autoload saved data when game starts.  

To make this addon work:  
Go to Project> Project Settings> Globals> Autoload.  
Make a Global variable "EF" with path "res://addons/Extras/ExtraFunctions.gd".  
Reload the project.  

To see saved files in file manager:  
Run Demo1.tscn and quit.  
Open computer's file manager and search "find_EF.save".  
Right click file "find_EF.save" and open to location.  
Note down the path somewhere.  

Currently these nodes are available:  
<img width="207" height="317" alt="extras" src="https://github.com/user-attachments/assets/effb3fe9-a2e6-4d41-921e-dc7f3459f716" />  
Most of these nodes are self explanatory by their names.  
Except NodeSaveLoadData.  
It is just simple extension of Node.  
It have 4 variables , and only one purpose , that is to save & load data  
<img width="346" height="140" alt="extras node " src="https://github.com/user-attachments/assets/7e11cfbc-01c0-42bb-94d4-ed837e2fc221" />
