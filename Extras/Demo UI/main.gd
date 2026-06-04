extends Node

@onready var env: WorldEnvironment = $"3Dset/env"
@onready var sun: DirectionalLight3D = $"3Dset/sun"
@onready var sunflare: TextureRect = $"3Dset/sun/sunflare"

@onready var Settings: ButtonWithSound = $settings
@onready var graphics: ButtonWithSound = $settings/Control/Graphics
@onready var audio: ButtonWithSound = $settings/Control/Audio
@onready var controls: ButtonWithSound = $settings/Control/Controls
@onready var levels: ButtonWithSound = $settings/Control/Levels

@onready var graphics_panel: Panel = $settings/Control/GraphicsPanel
@onready var shadows_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/shadows
@onready var glow_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/glow
@onready var fog_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/fog
@onready var ssr_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/ssr
@onready var ssil_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/ssil
@onready var ssao_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/ssao
@onready var sdfgi_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/sdfgi
@onready var dof_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/dof
@onready var motionblur_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/motionblur
@onready var lensflare_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/lensflare
@onready var autoexposure_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/autoexposure
@onready var msaa_ : OptionButtonAutoSaver = $settings/Control/GraphicsPanel/msaa
@onready var ssaa_ : OptionButtonAutoSaver = $settings/Control/GraphicsPanel/ssaa
@onready var taa_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/taa
@onready var fullscreen_ : CheckBoxAutoSaver = $settings/Control/GraphicsPanel/fullscreen
@onready var fov_ : HSliderAutoSaver = $settings/Control/GraphicsPanel/fov
@onready var fov_lable_ : Label = $"settings/Control/GraphicsPanel/fov lable"
@onready var resolution_ : HSliderAutoSaver = $settings/Control/GraphicsPanel/resolution
@onready var res_lable_ : Label = $"settings/Control/GraphicsPanel/res lable"
@onready var fps_ : HSliderAutoSaver = $settings/Control/GraphicsPanel/fps
@onready var fps_lable_ : Label = $"settings/Control/GraphicsPanel/fps lable"
@onready var upscale_ : OptionButtonAutoSaver = $settings/Control/GraphicsPanel/upscale

@onready var audio_panel_: Panel = $settings/Control/AudioPanel_
@onready var audio_panel:= $settings/Control/AudioPanel
@onready var master_sound: HSliderAutoSaver = $"settings/Control/AudioPanel/master sound"
@onready var player_sound: HSliderAutoSaver = $settings/Control/AudioPanel/player
@onready var ui_sound: HSliderAutoSaver = $settings/Control/AudioPanel/UI
@onready var music_sound: HSliderAutoSaver = $settings/Control/AudioPanel/music

@onready var controls_panel: VBoxContainer = $settings/Control/ControlsPanel
@onready var levels_panel: GridContainer = $settings/Control/LevelsPanel


func _ready() -> void:
	
	Settings.mouse_entered.connect(on_Settings_hover)
	graphics.mouse_entered.connect(on_graphics_hover)
	audio.mouse_entered.connect(on_audio_hover)
	controls.mouse_entered.connect(on_controls_hover)
	levels.mouse_entered.connect(on_levels_hover)
	
	fullscreen_.toggled.connect(on_fullscreen_btn_toggled)
	get_window().set_mode(int(fullscreen_.button_pressed)+2)
	
	update_graphics_values()


func _process(delta: float) -> void:
	ui_animations()
	update_graphics_values()
	update_audio_values()

func on_fullscreen_btn_toggled(toggled_on:bool):
	get_window().set_mode(int(toggled_on)+2)

func update_graphics_values():
	if graphics_panel.visible:
		sun.shadow_enabled=shadows_.button_pressed
		env.environment.glow_enabled=glow_.button_pressed
		env.environment.volumetric_fog_enabled=fog_.button_pressed
		env.environment.ssr_enabled=ssr_.button_pressed
		env.environment.ssil_enabled=ssil_.button_pressed
		env.environment.ssao_enabled=ssao_.button_pressed
		env.environment.sdfgi_enabled=sdfgi_.button_pressed
		env.camera_attributes.dof_blur_far_enabled=dof_.button_pressed
		env.camera_attributes.dof_blur_near_enabled=dof_.button_pressed
		# motionblur
		sunflare.visible=lensflare_.button_pressed
		env.camera_attributes.auto_exposure_enabled=autoexposure_.button_pressed
		get_viewport().msaa_3d = msaa_.selected
		get_viewport().screen_space_aa = ssaa_.selected
		get_viewport().use_taa = taa_.button_pressed
		#get_window().set_mode(int(fullscreen_.button_pressed)+2)
		get_viewport().get_camera_3d().set_fov(fov_.value)
		fov_lable_.text="FOV : "+str(int(fov_.value))
		get_window().set_scaling_3d_scale(resolution_.value)
		res_lable_.text="RESOLUTION : %04dX%04d" % [int(get_window().size.x*resolution_.value) , int(get_window().size.y*resolution_.value)]
		Engine.set_max_fps(fps_.value)
		fps_lable_.text="FPS : %04d"%[fps_.value]
		get_window().set_scaling_3d_mode(upscale_.selected)

func update_audio_values():
	if audio_panel.visible:
		AudioServer.set_bus_volume_db(0,master_sound.value)
		AudioServer.set_bus_volume_db(1,player_sound.value)
		AudioServer.set_bus_volume_db(2,music_sound.value)
		AudioServer.set_bus_volume_db(3,ui_sound.value)

#------------All-Animations------------#
func on_Settings_hover():
		Settings.button_pressed=!Settings.button_pressed
		graphics.button_pressed=false
		audio.button_pressed=false
		controls.button_pressed=false
		levels.button_pressed=false
func on_graphics_hover():
		graphics.button_pressed=!graphics.button_pressed
		audio.button_pressed=false
		controls.button_pressed=false
		levels.button_pressed=false
func on_audio_hover():
		audio.button_pressed=!audio.button_pressed
		graphics.button_pressed=false
		controls.button_pressed=false
		levels.button_pressed=false
func on_controls_hover():
		controls.button_pressed=!controls.button_pressed
		audio.button_pressed=false
		graphics.button_pressed=false
		levels.button_pressed=false
func on_levels_hover():
		levels.button_pressed=!levels.button_pressed
		audio.button_pressed=false
		controls.button_pressed=false
		graphics.button_pressed=false

func lerp_scale(btn:ButtonWithSound,panl:Control):
	var P=float(btn.button_pressed)
	var k:Control=panl
	k.scale.x=lerpf(k.scale.x,P,0.2)
	k.scale.y=lerpf(k.scale.y,P,0.2)
	k.visible=bool(k.scale.x)
func ui_animations():
	lerp_scale(Settings,Settings.get_child(0))
	lerp_scale(graphics,graphics_panel)
	lerp_scale(audio,audio_panel)
	lerp_scale(audio,audio_panel_)
	lerp_scale(controls,controls_panel)
	lerp_scale(levels,levels_panel)
#------------All-Animations------------#
