-----------------------------------------
-- Victory Overlay
-----------------------------------------
--libraries
local composer = require( "composer" )
local sqlite = require( "sqlite3" ) 
local path = system.pathForFile( "data.db", system.DocumentsDirectory )
local db = sqlite.open( path )
local scene = composer.newScene()
local path = system.pathForFile( "data_report.csv", system.DocumentsDirectory )
--sound handling (currently there's no need to create a soud table. might need if more resources are added)
local winAudio = audio.loadSound( "Audio/win.mp3" ) --audio file
local playWinAudio = nil --to save audio player and control its deletion

local chalkSound = audio.loadSound( "Audio/chalk-tap.mp3" ) --back button chalk sound
local playChalk = nil
--functions
local function onAccept() --continue menu handler 
	playButtonSound = audio.play( chalkSound )
	composer.hideOverlay( "slideUp", 175 )
end

local function onSend()
	local dropScores = [[DROP TABLE IF EXISTS scores;]]
	local dropActivity = [[DROP TABLE IF EXISTS activity;]]
	db:exec( dropScores )
	db:exec( dropActivity )
	local emailOptions = {
		subject = "Data Report",
		attachment = {
			{
				baseDir= system.DocumentsDirectory, 
			 	filename= "data_report.csv",
			 	type="text/csv"
		 	}
		}
	}
	native.showPopup( "mail", emailOptions )
	composer.gotoScene( "Scenes.main_menu" )
end
-----------------------------------------
-- Scenes
-----------------------------------------
function scene:create( event )
	local sceneGroup = self.view

	local mainGroup = display.newGroup()
	sceneGroup:insert( mainGroup ) 

	local background = display.newImageRect( mainGroup, "Assets/Background/pause.jpg", 700, 375 ) --background
	background.x = display.contentCenterX
	background.y = display.contentCenterY

	local notificationText = display.newText( mainGroup, langOptions.report_notification.text.head, display.contentCenterX, 90, "Fonts/FORTE.TTF", 35 )
	notificationText.font = native.newFont( "Fonts.FORTE", 16 )
	notificationText:setTextColor( 1 )	

	local confirmText = display.newText( mainGroup, langOptions.report_notification.text.confirm, display.contentCenterX, display.contentCenterY, "Fonts/FORTE.TTF", 35 )
	confirmText.font = native.newFont( "Fonts.FORTE", 16 )
	confirmText:setTextColor( 1 )	

	local sendData = display.newText( mainGroup, langOptions.report_notification.text.send, display.contentCenterX, display.contentCenterY + 35, "Fonts/FORTE.TTF", 35 )
	sendData.font = native.newFont( "Fonts.FORTE", 16 )
	sendData:setTextColor( 1 )	

	confirmText:addEventListener( "tap", onAccept )	
	sendData:addEventListener( "tap", onSend )		
end
--show()
function scene:show( event )
	local sceneGroup = self.view 
	local phase = event.phase
	local parent  = event.parent

	if( phase == "will" )then
	elseif( phase == "did" )then
	end
end
--hide()
function scene:hide( event )
	local sceneGroup = self.view 
	local phase = event.phase
	local parent = event.parent
	if( phase == "will" )then
	elseif( phase == "did" )then
		if(playChalk~=nil)then audio.stop( playChalk ) end--stop audio player
		playChalk = nil 			--delete audio player from memory
		audio.dispose( chalkSound )	--dispose audio file (shouldn't be use if the scene is gonna repeat)
		chalkSound = nil				--set audio file to null
		 --this function reset the timer in the parent element 
		composer.hideOverlay( "Scenes.Overlay.report_notification" )	--Remove scene when scene goes away	end
	end
end
--scenes listeners
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )
return scene