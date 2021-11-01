(
	modPanel.addModToSelection ( Normalize_Spl ()) ui:on
	$.modifiers[#Normalize_Spl].length = 150
	modPanel.addModToSelection ( Edit_Spline ()) ui:on
	subobjectLevel = 1
	actionMan.executeAction 0 "40021"
	max select all
	subobjectLevel = 2
	actionMan.executeAction 0 "40021"
	max select all
	macros.run "Editable Spline Object" "ESpline_Divide"
	-- splineOps.divide $
	subobjectLevel = 1
	macros.run "Editable Spline Object" "ESpline_Break"
	-- splineOps.startBreak $
	subobjectLevel = 0
	modPanel.addModToSelection ( sweep ()) ui:on
	$.modifiers[#Sweep].CurrentBuiltInShape = 2
	$.modifiers[#Sweep].CustomShapeName = ""
	$.modifiers[#Sweep][#Bar_Section].length = 6
	$.modifiers[#Sweep][#Bar_Section].width = 6
	$.modifiers[#Sweep][#Bar_Section].cornerRadius = 0
	$.modifiers[#Sweep][#Bar_Section].length = 12
	$.modifiers[#Sweep][#Bar_Section].width = 12
	$.modifiers[#Sweep].PivotAlignment = 4
	$.modifiers[#Sweep].Banking = on
	$.modifiers[#Sweep].GenerateMappingCoords = on
	$.modifiers[#Sweep].GenMatIDs = on
	$.modifiers[#Sweep].UseSectionIDs = on
	editPolyModifier = Edit_Poly()
	editPolyModifier.name = "Edit Poly - Dorada"
	addModifier $ editPolyModifier
	modPanel.addModToSelection ( Chamfer ()) ui:on
	$.modifiers[#Chamfer].amount = 0.75
	modPanel.addModToSelection ( UVW_Xform ()) ui:on
)
