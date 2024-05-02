-----------------------------------------
-- Menu
-----------------------------------------
--libraries
local composer = require( "composer" )
local scene = composer.newScene()
--Sounds
local chalkSound = audio.loadSound( "Audio/chalk-tap.mp3" ) --back button chalk sound
local playChalk = nil
--functions
local function setLang(option,event)
	if( option == "EN" )then
		lang = "EN"
	elseif( option == "ES" )then
		lang = "ES"
	end
end
local function setLangEng( event )
	setLang("EN", event)
	composer.gotoScene("Scenes.main_menu")
end
local function setLangEs( event )
	setLang("ES", event)
	composer.gotoScene("Scenes.main_menu")
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

	local langEng = display.newText( mainGroup, "Selecciona un idioma\nSelect a lenguage", display.contentCenterX, 100, "Fonts/FORTE.TTF", 35 )
	langEng.font = native.newFont( "Fonts.FORTE", 16 )
	langEng:setTextColor( 1 )

	local langEng = display.newText( mainGroup, "English", display.contentCenterX, display.contentCenterY + 15, "Fonts/FORTE.TTF", 35 )
	langEng.font = native.newFont( "Fonts.FORTE", 16 )
	langEng:setTextColor( 1 )

	local langEs = display.newText( mainGroup, "Español", display.contentCenterX, display.contentCenterY + 50, "Fonts/FORTE.TTF", 35 )
	langEs.font = native.newFont( "Fonts.FORTE", 16 )
	langEs:setTextColor( 1 )

	langEs:addEventListener( "tap", setLangEs )
	langEng:addEventListener( "tap", setLangEng )
end
function scene:show( event )
	local sceneGroup = self.view 
	local phase = event.phase

	if( phase == "will" )then
	elseif( phase == "did" )then
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
		composer.removeScene("Scenes.Overlay.menu")
	end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
return scene