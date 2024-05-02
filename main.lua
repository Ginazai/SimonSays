-----------------------------------------------------------------------------------------
--
-- Stimulation Game
--
-----------------------------------------------------------------------------------------
local composer = require( "composer" )
lang = "ES"
function trial()
	print("I'm being called from main")
end
--global function to play the voice of the scene
--Background sound
local backgroundOptions = 
{
	loops = -1,
	onComplete = callbackListener
}
local backgroundSound = audio.loadSound( "Audio/background.mp3" )
audio.play( backgroundSound, backgroundOptions )
--Trial:
--this function can be passed as far as play_menu.lua 
--however, it can't reach the game modes to unify the 
--voice that describes each scene
function activeVoice(source)
	local voice = audio.loadSound( source )
	local playVoice = audio.play( voice )
end
--go to menu when back space is selected
local function gotoMenu()
	composer.gotoScene( "Scenes.main_menu", { time=500, effect="slideRight" } )
end
local function onBkPress( event )
	if ( event.keyName == "back" ) then
	    if ( system.getInfo("platform") == "android" ) then
	    	composer.showOverlay("Scenes.Overlay.pause_menu")
	        return true
	    end
	end
	return false
end
--selecting main scene
composer.gotoScene( "Scenes.main_menu" )
Runtime:addEventListener( "key", onBkPress )