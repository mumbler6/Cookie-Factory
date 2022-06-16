using Godot;

public class PlacableObject : Resource
{
	[Export]
	public string _displayName { get; set; }

	[Export]
	public Vector2 _footprint { get; set; }

	[Export]
	public bool _rotatable { get; set; }

	[Export]
	public PackedScene _model { get; set; }
	
	public string _type = "placableObject";

	public PlacableObject(string name, Vector2 footprint, bool rotatable, PackedScene model)
	{
		_displayName = name;
		_footprint = footprint;
		_rotatable = rotatable;
		_model = model;
	}

	public PlacableObject()
	{
		_displayName = "name";
		_footprint = new Vector2(1, 1);
		_rotatable = true;
		_model = null;
	}
}
