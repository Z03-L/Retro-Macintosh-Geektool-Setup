use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- script is based on the script by alvin alexander here: https://alvinalexander.com/blog/post/mac-os-x/an-applescript-subroutine-that-returns-current-time-as-hours-mi/

set currentDate to current date

-- 24-hour format 
set timeString to time string of currentDate

set theWeekday to weekday of currentDate as string
set theMonth to month of currentDate as string
set theDay to day of currentDate as string

-- output
set welcomeMessage to "Welcome to Macintosh. It is currently " & timeString & " on" & "
" & theWeekday & ", " & theMonth & " " & theDay

return welcomeMessage
