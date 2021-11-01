-- Function for getting all groups and group items from the selection and storing them into separate arrays.Output: #(#(),#(),...)
function getGroupsFromSelection = (
	-- Collect all groups first
	allGroups = for i in selection as array where ( isGroupHead i ) collect i
	groupArray = #( )
	result = #( )

	-- Loop through each group and append all items to separate group arrays
	for theGroup in allGroups do (
		for i in theGroup where ( isGroupMember i ) do (
			-- Append each item to current group array
			append groupArray i
		)
		-- Add the current group array to the result
		append result groupArray
		-- Reset the group array
		groupArray = #( )
	)
	return result
)

-- Function for getting only valid groups based on the object class. Output: #()
function getValidGroups objectClass = (
	allGroups = getGroupsFromSelection()
	validGroup = #( )
	result = #( )

	-- Loop through all groups array
	for i = 1 to allGroups.count do ( 
		-- Loop through each group
		for j = 1 to allGroups[i].count do (
			if ( isKindOf allGroups[i][j] objectClass ) do (
				append validGroup allGroups[i][j]
			)
		)
		if ( ( allGroups[i].count - 1 ) == validGroup.count ) then (
			append result allGroups[i][1]
		)
		validGroup = #( )
	)
	return result
)

function main = (
	validGroups = getValidGroups Shape
	for i = 1 to validGroups.count do (
		select ( getNodeByName validGroups[i].name )
		try ( setGroupOpen $ false ) catch ( print ( "Group " + "'" + validGroups[i].name + "'" + " already closed." ) )
	)
)

main()