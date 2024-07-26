use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

-- CPU usage stats
set cpuStats to do shell script "top -l 1 | grep 'CPU usage'"
set userCPU to do shell script "echo " & quoted form of cpuStats & " | awk '{print $3}'"
set systemCPU to do shell script "echo " & quoted form of cpuStats & " | awk '{print $5}'"
set idleCPU to do shell script "echo " & quoted form of cpuStats & " | awk '{print $7}'"

-- memory usage stats
set freeMemory to do shell script "vm_stat | grep 'Pages free' | awk '{print int($3*4096/1024/1024) \" MB free\"}'"
set activeMemory to do shell script "vm_stat | grep 'Pages active' | awk '{print int($3*4096/1024/1024) \" MB active\"}'"
set inactiveMemory to do shell script "vm_stat | grep 'Pages inactive' | awk '{print int($3*4096/1024/1024) \" MB inactive\"}'"
set wiredMemory to do shell script "vm_stat | grep 'Pages wired down' | awk '{print int($3*4096/1024/1024) \" MB wired\"}'"

-- output
set output to "CPU Usage:
	User: " & userCPU & "
	System: " & systemCPU & "
	Idle: " & idleCPU & "

Memory Usage:
	" & freeMemory & "
	" & activeMemory & "
	" & inactiveMemory & "
	" & wiredMemory

return output
