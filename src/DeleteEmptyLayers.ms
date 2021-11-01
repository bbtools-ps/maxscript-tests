function deleteEmptyLayers = (
	for i = ( LayerManager.count - 1 ) to 1 by -1 do (
		theLayer = LayerManager.getLayer i
		if ( LayerManager.doesLayerHierarchyContainNodes theLayer.name != true ) then
		(
			LayerManager.deleteLayerByName theLayer.name
		)
	)
)

deleteEmptyLayers()