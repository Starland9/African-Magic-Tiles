extends AudioStreamPlayer2D
class_name Song


func initSong(stream_path: String):
	stream = AudioStream.new()
	stream.resource_path = stream_path
