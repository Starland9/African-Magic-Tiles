extends Area2D


func _on_body_entered(body):
	print(body.name)
	
	if body is Tile:
		body.queue_free()


func _on_area_entered(area):
	print(area)


func _on_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	print(area)
