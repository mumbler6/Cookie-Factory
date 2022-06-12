using Godot;
using System;

public class PlacableObject : Resource
{
	[Export]
	public string _name { get; set; }

	[Export]
	public Vector2 _footprint { get; set; }

	[Export]
	public bool _rotatable { get; set; }

	[Export]
	public Node _model { get; set; }

	public PlacableObject(string name, Vector2 footprint, bool rotatable, Node model)
	{
		_name = name;
		_footprint = footprint;
		_rotatable = rotatable;
		_model = model;
	}

	public PlacableObject()
	{
		_name = "name";
		_footprint = new Vector2(1, 1);
		_rotatable = true;
		_model = null;
	}
}
