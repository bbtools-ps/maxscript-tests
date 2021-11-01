(
	-- UI rollout declaration
	rollout buttonDisabler "Disable button"
	(
		button theButton "I can be disabled by deselecting object"

		-- what to do when the button is enabled and pressed, currently printing the node selection
		on theButton pressed do ( print $ )
	)

	-- Function for toggling (enable/disable) button based on selection and on what is selected
	function toggleButton ev nd = (
		-- Check if there is anything selected
		if selection.count > 0 then (
			-- Store selected objects into array
			local geometryArray = for o in selection where superClassOf o == geometryClass collect o
			-- Test if only geometry is selected and then enable or disable button
			if geometryArray.count == selection.count then ( 
				buttonDisabler.theButton.enabled = true 
			) else (
				buttonDisabler.theButton.enabled = false
			)
		) else ( 
			buttonDisabler.theButton.enabled = false
		)
	)

	-- create the UI
	theNewFloater = newRolloutFloater "ButtonDisabler" 300 220
	addRollout buttonDisabler theNewFloater

	-- run function right after the UI creation to update the button state upon current selection, is there any selected objects on start up ?
	toggleButton ev nd

	-- add node event callback on node selection & deselection on node selection changes the function is ran.
	NodeEventCallback selectionChanged:toggleButton
)