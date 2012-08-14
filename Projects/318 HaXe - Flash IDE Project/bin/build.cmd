@echo off
del /s "bin\as3\*.*" /q
@echo on
haxe -cp src -main Main -as3 bin/as3
replace "bin\special\Boot.as" "bin\as3\flash"