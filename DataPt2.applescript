use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- disk usage stats
set diskUsage to do shell script "df -h / | awk 'NR==2 {print $3 \" used, \" $4 \" available\"}'"

-- download and upload speed
set rxBytesInitial to do shell script "netstat -ibn | grep -e 'en0' -m 1 | awk '{print $7}'"
delay 1
set rxBytesFinal to do shell script "netstat -ibn | grep -e 'en0' -m 1 | awk '{print $7}'"
set txBytesInitial to do shell script "netstat -ibn | grep -e 'en0' -m 1 | awk '{print $10}'"
delay 1
set txBytesFinal to do shell script "netstat -ibn | grep -e 'en0' -m 1 | awk '{print $10}'"

set rxKBps to round (((rxBytesFinal as integer) - (rxBytesInitial as integer)) * 8 / 1024)
set txKBps to round (((txBytesFinal as integer) - (txBytesInitial as integer)) * 8 / 1024)

-- system uptime
set systemUptime to do shell script "uptime | awk -F'( |,|:)+' '{print $6, \"hours\", $7, \"minutes\"}'"

-- battery level
set batteryInfo to do shell script "pmset -g batt | grep '%' | awk '{print $3}' | tr -d '%;'"
set batteryLevel to batteryInfo & "%"

-- output
set output to "Disk Usage:
	" & diskUsage & "

Download: " & rxKBps & " kbps
Upload: " & txKBps & " kbps 

System Uptime:
	" & systemUptime & "

Battery Level:
	" & batteryLevel

return output
