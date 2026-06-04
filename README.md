<img width="16" height="16" alt="btn" src="https://github.com/user-attachments/assets/49f2cef6-b6d6-43cc-a58e-d4f138dae4c8" />**Extras**  

This addon provides extra custom **functions** , **buttons** and **other-nodes** that auto-save and auto-load data in the game. And provide in game ui sound.  

Setup:  
1. Make sure "Extras" folder is visible under "addons" folder.  
2. Add a global variable "EF"  
   <img width="850" height="269" alt="_Do This" src="https://github.com/user-attachments/assets/2a69b76c-50d7-4cff-bb91-8ea1beb6af15" />  
3. Run "main.tscn" from "res://addons/Extras/Demo UI/"
4. Make in game changes , quit , run it again , check if previous settings are loaded.


Currently these nodes are available:  
------------------------------------------
<img width="16" height="16" alt="NodeSaveLoadData" src="https://github.com/user-attachments/assets/34d6c8ca-17b4-4225-bd3d-91cb82d948db" />NodeSaveLoadData "Only saves & loads given data"  
<img width="16" height="16" alt="btn" src="https://github.com/user-attachments/assets/52309e83-9381-488b-82ec-ae4dcfbc483d" />ButtonWithSound  
<img width="16" height="16" alt="ButtonChangeScene" src="https://github.com/user-attachments/assets/2ba4a28b-ebcd-4fe8-a9ea-0fd867d66f94" />ButtonChangeScene  
<img width="16" height="16" alt="CheckBoxAutoSaver" src="https://github.com/user-attachments/assets/e461d6a0-9823-4816-bb20-d6bc516eabd9" />CheckBoxAutoSaver  
<img width="16" height="16" alt="CheckButtonAutoSaver" src="https://github.com/user-attachments/assets/f1f80ca3-47d0-4530-96b7-4ab81e931926" />CheckButtonAutoSaver  
<img width="16" height="16" alt="HSliderAutoSaver" src="https://github.com/user-attachments/assets/565ec3ce-472b-4029-955a-c6f3030ea1d4" />HSliderAutoSaver  
<img width="16" height="16" alt="VSliderAutoSaver" src="https://github.com/user-attachments/assets/8e3e7a7b-b86e-4f7c-805f-c55822fe10a9" />VSliderAutoSaver  
<img width="16" height="16" alt="InputKeyEditor" src="https://github.com/user-attachments/assets/f63577cd-b01f-45b5-ae97-44e8b7484277" />InputKeyEditor  
<img width="16" height="16" alt="LineEditAutoSaver" src="https://github.com/user-attachments/assets/740498a3-c705-40ec-911c-732863261f41" />LineEditAutoSaver  
<img width="16" height="16" alt="OptionButtonAutoSaver" src="https://github.com/user-attachments/assets/082bf708-3ae9-4f7a-b8c5-47331ce92a03" />OptionButtonAutoSaver  
<img width="16" height="16" alt="QuitGame" src="https://github.com/user-attachments/assets/79f48d11-7e7f-41e4-a590-084286a1b67e" />QuitGame  
<img width="16" height="16" alt="TextEditAutoSaver" src="https://github.com/user-attachments/assets/2b14b80b-c1fd-409c-bd30-eba3ec023d8c" />TextEditAutoSaver  

<img width="16" height="16" alt="TextEditAutoSaver" src="https://github.com/user-attachments/assets/2b14b80b-c1fd-409c-bd30-eba3ec023d8c" />TextEditAutoSaver and <img width="16" height="16" alt="LineEditAutoSaver" src="https://github.com/user-attachments/assets/740498a3-c705-40ec-911c-732863261f41" />LineEditAutoSaver can also execute text as code. when in game, type 1+1 then Shift+Enter to execute code.  


And these functions are available :  
------------------------------------------
EF.Save_Data(data:Variant,file_name:String)  
EF.Load_Data(data:Variant,file_name:String)  
EF.Execute_String(txt:String)  
EF.add_key_to_Input_Action(Input_Action:String,Key_Name:String)  
EF.remove_a_key_from_Input_Action(Input_Action:String,Key_Name:String)  
EF.remove_all_keys_from_Input_Action(Input_Action:String) 
EF.Device_Type()  
