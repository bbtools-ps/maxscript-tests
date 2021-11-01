-- Function for replacing backslashes with the given string
function replaceBackslashes inputString replaceString = (
	-- VARIABLES
	arr = #( )
	result = ""

	for i = 1 to inputString.count do (
		if inputString[i] == "\\" then (
			append arr replaceString
		) else (
			append arr inputString[i]
		)
	)

	for j = 1 to arr.count do (
		result += arr[j]
	)

	return result
)

-- Function for getting the destination folder based on the relative path for the current script
function getDestinationFolder = (
	-- Get the current script filepath + filename
	scriptFilePath = getThisScriptFilename()
	-- Replace backslashes from the path with forward slashes for easier regex replacement
	newPath = replaceBackslashes scriptFilePath "/"
	rgx = dotnetObject "System.Text.RegularExpressions.Regex" "\/[^/]+$"
	result = rgx.Replace newPath "/dist/"
	return result
)

-- Main function for encrypting scripts that are located inside the destination folder
function main = (
	destinationFolder = getDestinationFolder()
	print destinationFolder
	-- Get the maxscript files from the destination folder
	scripts = getFiles ( destinationFolder + "/*.ms" )
	-- Encrypt all scripts
	for i = 1 to scripts.count do (
		encryptScript scripts[i] ;
	)
	quitMax #noPrompt
)

main()
