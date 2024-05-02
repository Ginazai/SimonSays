-----------------------------------------
-- Pause Menu
-----------------------------------------
--libraries
local composer = require( "composer" )
local scene = composer.newScene()
--Sounds
local chalkSound = audio.loadSound( "Audio/chalk-tap.mp3" ) --back button chalk sound
local playChalk = nil
--functions
local function gotoMenu()
	playChalk = audio.play( chalkSound )
	composer.gotoScene( "Scenes.main_menu", { time=100, effect="slideUp" } ) 
end
local function onResume()
	playChalk = audio.play( chalkSound )
	composer.hideOverlay( "slideUp", 175 )
end
-----------------------------------------
-- Scenes
-----------------------------------------
function scene:create( event )
	local sceneGroup = self.view 

	local mainGroup = display.newGroup()
	sceneGroup:insert( mainGroup )

	local uiGroup = display.newGroup()
	sceneGroup:insert( uiGroup )

	local background = display.newImageRect( mainGroup, "Assets/Background/pause.jpg", 700, 375 ) --background
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local pauseTextOptions = 
	{
		parent = uiGroup,
	    text = langOptions.pauseMenu.text.head,     
	    x = display.contentCenterX,
	    y = 100,
	    font = "Fonts/FORTE.TTF",   
	    fontSize = 35,
	    align = "center" 
	}
	local pauseText = display.newText( pauseTextOptions )
	pauseText.font = native.newFont( "Fonts.FORTE", 16 )
	pauseText.align = "center"
	pauseText:setTextColor( 1 )

	local option1 = display.newText( uiGroup, langOptions.pauseMenu.text.yes, display.contentCenterX, 190, "Fonts/FORTE.TTF", 35 )
	option1.font = native.newFont( "Fonts.FORTE", 16 )
	option1:setTextColor( 1 )

	local option2 = display.newText( uiGroup, langOptions.pauseMenu.text.no, display.contentCenterX, 240, "Fonts/FORTE.TTF", 35 )
	option2.font = native.newFont( "Fonts.FORTE", 16 )
	option2:setTextColor( 1 )

	option1:addEventListener( "tap", gotoMenu )
	option2:addEventListener( "tap", onResume )
end
function scene:show( event )
	local sceneGroup = self.view 
	local phase = event.phase

	if( phase == "will" )then
	elseif( phase == "did" )then
		activeVoice(langOptions.pauseMenu.audio.confirm)
	end
end
function scene:hide( event )
	local sceneGroup = self.view 
	local phase = event.phase
	local parent = event.parent

	if( phase == "will" )then
	elseif( phase == "did" )then
		if (playQuestion ~= nil)then audio.stop( playQuestion ) end
		playQuestion = nil
		composer.hideOverlay("Scenes.Overlay.pause_menu")
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
return scene