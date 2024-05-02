-----------------------------------------
-- Main Menu
-----------------------------------------
local composer = require( "composer" )
local scene = composer.newScene()

langScene = nil
langScene2 = nil
--initializing variables
local background
local board
local logo
local playButton
local scoreButton

local chalkSound = audio.loadSound( "Audio/chalk-tap.mp3" )
local chalkButton = nil
-----------------------------------------
--canva settings
-----------------------------------------
firstHalfCenterX = display.contentCenterX / 2
secondHalfCenterX = display.contentCenterX + (firstHalfCenterX)

firstHalfCenterY = display.contentCenterY / 2
secondHalfCenterY = display.contentCenterY + (firstHalfCenterY)
referenceSize = nil
if( display.contentHeight > display.contentWidth )then referenceSize = display.contentHeight
else referenceSize = display.contentWidth end
------------------------------------------
--TEMP TRIAL AREA TO UNIFY CODE
------------------------------------------
-----------------------------------------
-- Global variables
-----------------------------------------
selectedBasket = {}
-----------------------------------------
-- Global variables
-----------------------------------------
-----------------------------------------
-- Sheets
-----------------------------------------
fSheet = 
{	--Food sheet frames
	frames = 
	{
		{ --frame 1
			x = 0,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 2
			x = 296,
			y = 0,
			width = 290,
			height = 293
		},
		{ --frame 3
			x = 591,
			y = 0,
			width = 291,
			height = 293
		},
		{ --frame 4
			x = 882,
			y = 0,
			width = 291,
			height = 293
		},
		{ --frame 5
			x = 1173,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 6
			x = 1466,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 7
			x = 1759,
			y = 0,
			width = 290,
			height = 293
		},
		{ --frame 8
			x = 2051,
			y = 0,
			width = 292,
			height = 293
		},
		{ --frame 9
			x = 2341,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 10
			x = 2638,
			y = 0,
			width = 293,
			height = 293
		}
	},
	numframes = 10,
	sheetContentWidth = 2931,
	sheetContentHeight = 293
}
aSheet = 	
{	--Animals sheet frames
	frames = 
	{
		{ --frame 1
			x = 0,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 2
			x = 296,
			y = 0,
			width = 292,
			height = 293
		},
		{ --frame 3
			x = 591,
			y = 0,
			width = 291,
			height = 293
		},
		{ --frame 4
			x = 882,
			y = 0,
			width = 291,
			height = 293
		},
		{ --frame 5
			x = 1173,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 6
			x = 1466,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 7
			x = 1759,
			y = 0,
			width = 290,
			height = 293
		},
		{ --frame 8
			x = 2049,
			y = 0,
			width = 292,
			height = 293
		},
		{ --frame 9
			x = 2343,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 10
			x = 2636,
			y = 0,
			width = 295,
			height = 293
		}
	},
	numframes = 10,
	sheetContentWidth = 2931,
	sheetContentHeight = 293
}
cSheet = 	
{	--Clothes sheet frames
	frames = 
	{
		{ --frame 1
			x = 0,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 2
			x = 296,
			y = 0,
			width = 292,
			height = 193
		},
		{ --frame 3
			x = 591,
			y = 0,
			width = 291,
			height = 293
		},
		{ --frame 4
			x = 882,
			y = 0,
			width = 285,
			height = 240
		},
		{ --frame 5
			x = 1173,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 6
			x = 1466,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 7
			x = 1759,
			y = 0,
			width = 290,
			height = 244
		},
		{ --frame 8
			x = 2049,
			y = 0,
			width = 289,
			height = 246
		},
		{ --frame 9
			x = 2343,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 10
			x = 2636,
			y = 0,
			width = 295,
			height = 240
		}
	},
	numframes = 10,
	sheetContentWidth = 2928,
	sheetContentHeight = 244
}
pSheet = 	
{	--Plants sheet frames
	frames = 
	{
		{ --frame 1
			x = 0,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 2
			x = 296,
			y = 0,
			width = 292,
			height = 293
		},
		{ --frame 3
			x = 591,
			y = 0,
			width = 291,
			height = 293
		},
		{ --frame 4
			x = 882,
			y = 0,
			width = 291,
			height = 293
		},
		{ --frame 5
			x = 1173,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 6
			x = 1466,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 7
			x = 1759,
			y = 0,
			width = 290,
			height = 293
		},
		{ --frame 8
			x = 2049,
			y = 0,
			width = 292,
			height = 293
		},
		{ --frame 9
			x = 2343,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 10
			x = 2636,
			y = 0,
			width = 295,
			height = 293
		}
	},
	numframes = 10,
	sheetContentWidth = 2930,
	sheetContentHeight = 293
}
vSheet = 	
{	--Vehicles sheet frames
	frames = 
	{
		{ --frame 1
			x = 0,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 2
			x = 296,
			y = 0,
			width = 292,
			height = 293
		},
		{ --frame 3
			x = 591,
			y = 0,
			width = 288,
			height = 293
		},
		{ --frame 4
			x = 882,
			y = 0,
			width = 291,
			height = 293
		},
		{ --frame 5
			x = 1173,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 6
			x = 1466,
			y = 0,
			width = 293,
			height = 293
		},
		{ --frame 7
			x = 1759,
			y = 0,
			width = 290,
			height = 293
		},
		{ --frame 8
			x = 2049,
			y = 0,
			width = 292,
			height = 293
		},
		{ --frame 9
			x = 2343,
			y = 0,
			width = 295,
			height = 293
		},
		{ --frame 10
			x = 2636,
			y = 0,
			width = 295,
			height = 293
		}
	},
	numframes = 10,
	sheetContentWidth = 2930,
	sheetContentHeight = 293
}
foodSheet = graphics.newImageSheet( "Assets/Food/food-sheet.png", fSheet )
animalSheet = graphics.newImageSheet( "Assets/Animals/animals-sheet.png", aSheet )
clothesSheet = graphics.newImageSheet( "Assets/Clothes/clothes-sheet.png", cSheet )
plantsSheet = graphics.newImageSheet( "Assets/Plants/plants-sheet.png", pSheet )
vehiclesSheet = graphics.newImageSheet( "Assets/Vehicles/vehicles-sheet.png", vSheet )
-----------------------------------------
-- Sheets
-----------------------------------------
-----------------------------------------
-- Lang handling
-----------------------------------------
langOptions = {}
if(lang=="ES")then
	langOptions.categorize = {
		text = {
			animals = "Animales",
			plants = "Plantas",
			food = "Comida",
			clothes = "Ropa",
			vehicles = "Vehiculos"
		},
		audio = {
			animals = "Audio/voice/ES/animales.mp3",
			plants = "Audio/voice/ES/plantas.mp3",
			food = "Audio/voice/ES/comida.mp3",
			clothes = "Audio/voice/ES/ropa.mp3",
			vehicles = "Audio/voice/ES/vehiculos.mp3" 
		}
	}
	langOptions.categorize_win_1 = {
		text = {
			head = "Nivel 1 completado!"
		},
		audio = {
			voice = "Audio/voice/ES/nivel_1.mp3"
		}
	}
	langOptions.categorize_win_2 = {
		text = {
			head = "Nivel 2 completado!"
		},
		audio = {
			voice = "Audio/voice/ES/nivel_2.mp3"
		}
	}
	langOptions.categorize_win_3 = {
		audio = {
			chance1 = "Audio/voice/ES/ganar_2.mp3",
			chance2 = "Audio/voice/ES/ganar_2.mp3"
		}
	}
	langOptions.pauseMenu = {
		text = {
			head = "Seguro que deseas salir?",
			yes = "Si",
			no = "No"
		},
		audio = {
			confirm = "Audio/voice/ES/salir.mp3"
		}
	}
	langOptions.report_notification = {
		text = {
			head = "Reporte creado con exito!",
			confirm = "Confirmar",
			send = "Enviar"
		}
	}
elseif(lang=="EN")then
	langOptions.categorize = {
		text = {
			animals = "Animals",
			plants = "Plants",
			food = "Food",
			clothes = "Clothes",
			vehicles = "Vehicles"
		},
		audio = {
			animals = "Audio/voice/get_animals.wav",
			plants = "Audio/voice/put_plants.wav",
			food = "Audio/voice/insert_food.wav",
			clothes = "Audio/voice/put_clothes.wav",
			vehicles = "Audio/voice/which_are_vehicles.wav"
		}
	}
	langOptions.categorize_win_1 = {
		text = {
			head = "Level 1 completed!"
		},
		audio = {
			voice = "Audio/voice/level_1_finish.wav"
		}
	}
	langOptions.categorize_win_2 = {
		text = {
			head = "Level 2 completed!"
		},
		audio = {
			voice = "Audio/voice/level_2_finish.wav"
		}
	}
	langOptions.categorize_win_3 = {
		audio = {
			chance1 = "Audio/voice/win_1.wav",
			chance2 = "Audio/voice/win_2.wav"
		}
	}
	langOptions.pauseMenu = {
		text = {
			head = "Are you sure you\nwanna exit?",
			yes = "Yes",
			no = "No"
		},
		audio = {
			confirm = "Audio/voice/exit.wav"
		}
	}
	langOptions.report_notification = {
		text = {
			head = "Report successfully created!",
			confirm = "Confirm",
			send = "Send"
		}
	}
end
-----------------------------------------
-- Categorize Lang handling
-----------------------------------------
-----------------------------------------
-- Global Functions
-----------------------------------------
--scene button handler
function gotoPlayMenu() --go back to previous screen (play menu)
	playChalk = audio.play( chalkSound )
	composer.gotoScene( "Scenes.play_menu", { time=500, effect="slideRight" } )
end
--pause menu handler
modalOptions = { --pause menu configuration
    isModal = true,
    time=350, 
    effect="slideDown",
    params = {}
}
modalVictory = { --victory menu configuration
    isModal = true,
    time=500, 
    effect="zoomOutInFade",
    params = {}
}
function pauseMenu() --pause_menu handler (implement configuration above)
	playChalk = audio.play( chalkSound )
	composer.showOverlay( "Scenes.Overlay.pause_menu", modalOptions )
end
--listen name of the category 
function instructions()
	if( selectedBasket.name == "foodBasket" )then
		return langOptions.categorize.audio.food
	elseif( selectedBasket.name == "animalBasket" )then
		return langOptions.categorize.audio.animals
	elseif( selectedBasket.name == "vehiclesBasket" )then
		return langOptions.categorize.audio.vehicles
	elseif( selectedBasket.name == "clothesBasket" )then
		return langOptions.categorize.audio.clothes
	elseif( selectedBasket.name == "plantsBasket" )then
		return langOptions.categorize.audio.plants
	end
end
-----------------------------------------
-- Global Functions
-----------------------------------------
------------------------------------------
--TEMP TRIAL AREA TO UNIFY CODE
------------------------------------------
-----------------------------------------
--button events
-----------------------------------------
local function showMenu()
	composer.gotoScene("Scenes.Overlay.menu")
end
local function gotoPlay()
	chalkButton = audio.play( chalkSound )
	local play_options = {
		time=700, 
		effect="slideLeft"
	}
	composer.gotoScene( "GameMode.free", play_options )
end
local function gotoScore()
	chalkButton = audio.play( chalkSound )
	composer.gotoScene( "Scenes.scores", { time=700, effect="slideUp" } )
end
-----------------------------------------
-- Scene
-----------------------------------------
function scene:create( event )
	local sceneGroup = self.view
	-- local permissionOptions = {
	-- 	appPermission = "Storage",
	-- 	urgency = "Critical",
	-- 	rationaleTitle = "Storage permission required"
	-- }
	-- native.showPopup( "requestAppPermission", permissionOptions )

	background = display.newImageRect( sceneGroup, "Assets/Background/main.png", display.actualContentWidth, display.actualContentHeight )
	background.x = display.contentCenterX
	background.y = display.contentCenterY


	-- board = display.newImageRect( sceneGroup, "Assets/Background/board.png", 600, 315 )
	-- board.x = display.contentCenterX
	-- board.y = display.contentCenterY + 5

	-- logo = display.newImageRect( sceneGroup, "Assets/Background/logo.png", 229, 65 )
	-- logo.x = display.contentCenterX 
	-- logo.y = 110

	playButton = display.newImageRect( sceneGroup, "Assets/Buttons/start.png",  130, 60 ) 
	playButton.x = display.contentCenterX
	playButton.y = 190

	scoreButton = display.newImageRect( sceneGroup, "Assets/Buttons/score.png", 90, 45 ) 
	scoreButton.x = display.contentCenterX
	scoreButton.y = 255

	local menuButton = display.newImageRect( sceneGroup, "Assets/Buttons/menu.png", 80, 40 )
	menuButton.x = secondHalfCenterX + (secondHalfCenterX/4.3)
	menuButton.y = 10

	menuButton:addEventListener( "tap", showMenu )
	playButton:addEventListener( "tap", gotoPlay )
	scoreButton:addEventListener( "tap", gotoScore )
end
--hide()
function scene:hide( event )
	local phase = event.phase

	if( phase == "will" )then
	elseif( phase == "did" )then
		if (chalkButton ~= nil)then audio.stop( chalkButton ) end
		chalkButton = nil
		composer.removeScene("Scenes.main_menu")
	end
end
scene:addEventListener( "create", scene )
scene:addEventListener( "hide", scene )
return scene