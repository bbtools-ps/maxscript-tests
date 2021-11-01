-- Function for selecting objects in viewport
function selectInViewport val:VRayProxy = (
	-- VARIABLES
	local mySelectionFilter, mySelection
	-- Store selection filter to variable
	mySelectionFilter = GetSelectFilter()
	-- Set selection filter to All
	SetSelectFilter 1
	-- Selection: Select All
	actionMan.executeAction 0 "40021"
	max select all
	-- Store selection to variable
	mySelection = getCurrentSelection()
	-- Clear the selection
	clearSelection()
	-- Select only VrayProxy objects
	select ( for o in mySelection where classof o == val collect o )
	-- Return selection filter to mySelectionFilter
	SetSelectFilter mySelectionFilter
)
-- Select only VRayProxy objects
-- selectInViewport val:VRayProxy

-- Function for printing object name, superclass, class
function printObjectClasses = (
	for o in objects do print ( "Object name: " + o.name as string + " Superclass: " + superclassof o as string + " Class: " + classof o as string )
)

-- Function for turning selected lights on/off (toggle)
function turnLights val:true = (
	-- If selection exists proceed
	if selection.count > 0 do (
		-- Loop the objects in selection, find only the lights, toggle them on or off
		for o in selection where superclassof o == light do o.on != o.on
	)
)

-- UI
rollout myRollout "Test" (
	button btnSelectVrayProxies "Select VRayProxies" height:25 width:150
	button btnPrintObjectClasses "Print Obj Classes" height:25 width:150
	button btnTurnLights "Turn Lights On/Off" height:25 width:150

	-- Functionality

	on btnSelectVrayProxies pressed do (
		selectInViewport val:VRayProxy
	)

	on btnPrintObjectClasses pressed do (
		printObjectClasses()
	)

	on btnTurnLights pressed do (
		turnLights()
	)
)

try( destroyDialog myRollout ) catch()
createdialog myRollout width:275