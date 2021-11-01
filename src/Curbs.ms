function normalizeSplineModifier lengthValue = (
	local theModifier = Normalize_Spl()
	theModifier.length = lengthValue
	-- theModifier.length = ( curveLength $ ) / ( numKnots $ )
	addModifier $ theModifier
)

function editSplineModifier = (
	local theModifier = Edit_Spline()
	addModifier $ theModifier
)

function sweepModifier = (
	local theModifier = sweep()
	theModifier.PivotAlignment = 4
	theModifier.Banking = on
	theModifier.GenerateMappingCoords = on
	theModifier.GenMatIDs = on
	theModifier.UseSectionIDs = on
	-- Set the section type to "Bar"
	theModifier.CurrentBuiltInShape = 2
	addModifier $ theModifier
	$.modifiers[#Sweep][#Bar_Section].length = 6
	$.modifiers[#Sweep][#Bar_Section].width = 6
	$.modifiers[#Sweep][#Bar_Section].cornerRadius = 0
	$.modifiers[#Sweep][#Bar_Section].length = 12
	$.modifiers[#Sweep][#Bar_Section].width = 12
)

function editPolyModifier modName = (
	local theModifier = Edit_Poly()
	theModifier.name = modName
	addModifier $ theModifier
)

function chamferModifier chamferAmount = (
	local theModifier = Chamfer()
	theModifier.amount = chamferAmount
	addModifier $ theModifier
)

function uvwModifier = (
	local theModifier = UVW_Xform()
	addModifier $ theModifier
)

function main = (
	clearListener()
	-- Limit the selection to Shape objects
	for o in selection where o = isKindOf o Shape do (
		normalizeSplineModifier 150
		editSplineModifier()
		modPanel.setCurrentObject $.modifiers[1]
		subobjectLevel = 1
		max select all
		subobjectLevel = 2
		max select all
		splineOps.divide $
		subobjectLevel = 1
		splineOps.startBreak $
		sweepModifier()
		editPolyModifier "Dorada"
		chamferModifier .75
		uvwModifier()
	)
)

main()