-----------------------------------------
-- Level 2 completed overlay
-----------------------------------------
--libraries
local json = require( "json" )
local composer = require( "composer" )
local scene = composer.newScene()
--sound handling (currently there's no need to create a soud table. might need if more resources are added)
local winAudio = audio.loadSound( "Audio/win.mp3" ) --audio file
local playWinAudio = nil --to save audio player and control its deletion

local chalkSound = audio.loadSound( "Audio/chalk-tap.mp3" ) --back button chalk sound
local playChalk = nil

local playSound = audio.loadSound( "Audio/magic-2.mp3" )
local playButtonSound = nil
--functions
local function audioPlayer()
	activeVoice(langOptions.categorize_win_2.audio.voice)
end
local function onExit() --exiting menu handler
	playChalk = audio.play( chalkSound )
	composer.gotoScene( "Scenes.play_menu", { time=100, effect="slideUp" } )
end
local function onContinue() --continue menu handler 
	playButtonSound = audio.play( playSound )
	composer.gotoScene( "GameMode.categorize_3", { time=300, effect="zoomInOutFade" } )
end
-----------------------------------------
-- Scenes
-----------------------------------------
function scene:create( event )
	playWinAudio = audio.play( winAudio ) -- play audio when overlay shows
	local sceneGroup = self.view 			
	local selectedBackground = event.params.background --to load background that is in use in the parent element

	local mainGroup = display.newGroup() --basic display group for general elements
	sceneGroup:insert( mainGroup )

	local uiGroup = display.newGroup()	--for ui elements
	sceneGroup:insert( uiGroup )

	local background = display.newImageRect( mainGroup, selectedBackground, 700, 375 ) --background from parent element
	background.fill.effect = 'filter.blurGaussian'	--applying blur to background
	background.fill.effect.horizontal.blurSize = 10
	background.fill.effect.horizontal.sigma = 150
	background.fill.effect.vertical.blurSize = 10
	background.fill.effect.vertical.sigma = 150
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local board = display.newImageRect( mainGroup, "Assets/Background/win.png", 0, 0 ) --board element display
	board.x = display.contentCenterX
	board.y = display.contentCenterY
	--transition handler for board
	transition.from( board, { width=0, height=0 } )
	transition.to( board, { width=600, height=315, time=600 } )

	local levelText = display.newText( mainGroup, langOptions.categorize_win_2.text.head, display.contentCenterX, display.contentCenterY - 10, "Fonts/FORTE.TTF", 40 )
	levelText.font = native.newFont( "Fonts.FORTE", 16 )
	levelText:setTextColor( 1, 0.85, 0.31  )
	--transition handler for prize
	levelText.alpha = 0
	transition.to( levelText, { alpha=1, time=500, delay=500 } ) --transition control for text

	local backButton = display.newImageRect( uiGroup, "Assets/Buttons/back.png", 50, 25 ) --go back button
	backButton.x = display.safeScreenOriginX + 35
	backButton.y = 16

	local continueButton = display.newImageRect( uiGroup, "Assets/Buttons/continue.png", 50, 25 ) --level 2 button (level 2 not yet implemented)
	continueButton.x = display.contentCenterX + 215 
	continueButton.y = 300

	backButton:addEventListener( "tap", onExit ) --go back listener
	continueButton:addEventListener( "tap", onContinue ) --continue button listener
end
--show()
function scene:show( event )
	local sceneGroup = self.view 
	local phase = event.phase
	local parent  = event.parent

	if( phase == "will" )then
	elseif( phase == "did" )then
		timer.performWithDelay( 900, audioPlayer )
	end
end
--hide()
function scene:hide( event )
	local sceneGroup = self.view 
	local phase = event.phase
	local parent = event.parent
	if( phase == "will" )then
	elseif( phase == "did" )then
		audio.stop( playWinAudio ) --stop audio player
		playWinAudio = nil 			--delete audio player from memory
		audio.dispose( winAudio )	--dispose audio file (shouldn't be use if the scene is gonna repeat)
		winAudio = nil				--set audio file to null
		composer.hideOverlay( "Scenes.Overlay.categorize_2_win" )		--Remove scene when scene goes away	end
	end
end
--scenes listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
return scene