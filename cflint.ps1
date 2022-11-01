cd c:\dev\www\yoobi\
echo "interceptor"
java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -includeRule "ARG_VAR_CONFLICT,MISSING_VAR,NESTED_CFOUTPUT,NO_DEFAULT_INSIDE_SWITCH" -folder interceptors
echo "handlers"
java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -includeRule "ARG_VAR_CONFLICT,MISSING_VAR,NESTED_CFOUTPUT" -folder handlers
echo "yoobi_v2\handlers"
java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -includeRule "ARG_VAR_CONFLICT,MISSING_VAR,NESTED_CFOUTPUT" -folder yoobi_v2\handlers
echo "model"
java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -includeRule "ARG_VAR_CONFLICT,MISSING_VAR,NESTED_CFOUTPUT,AVOID_USING_GETINSTANCE,MISSING_SEMI" -folder model
#Read-Host -Prompt "Press any key to continue or CTRL+C to quit"
#java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -rulegroups BugProne -folder model
#Read-Host -Prompt "Press any key to continue or CTRL+C to quit"
#java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -rulegroups BugProne -folder handlers
#Read-Host -Prompt "Press any key to continue or CTRL+C to quit"
#java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -rulegroups BugProne -folder yoobi_v2\handlers
#Read-Host -Prompt "Press any key to continue or CTRL+C to quit"
#java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -rulegroups BugProne -folder model

#java -jar C:\dev\CFLint-1.5.0-all.jar -stdout -text -file C:\dev\www\yoobi\model\KipService.cfc -includeRule "MISSING_SEMI"