use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- script by jayylmao: https://github.com/jayylmao/Retro-Macintosh-Geektool-Setup/blob/master/spotifyControl.applescript

tell application "Spotify"
	-- if spotify is running, set the variable c to the current track
	if it is running then
		set c to the current track
		set a to album of current track
		
		-- if spotify is playing music, set the variable albumArt to the artwork of the current track and return that value as text
		if player state is playing or player state is paused then
			set albumUrl to artwork url of current track
			-- tell geektool to tell its image geeklet with the name "albumArt" to set its image url to the variable albumArt as text
			tell application "GeekTool Helper"
				tell its image geeklet "albumArt"
					set the image url to albumUrl
				end tell
			end tell
			return "Song: " & ((name of c & " 
" & "Album: " & album of c as text) & "
" & "Artist: " & artist of c as text) & "
"
			-- otherwise, return "not playing"
		else
			return "
" & "
Not playing" as text
		end if
		
		-- if spotify is not running, return "not playing"
	else
		tell application "GeekTool Helper"
			tell its image geeklet "albumArt"
				set the image url to " "
			end tell
		end tell
		return "
" & "
Not playing" as text
	end if
end tell