using Godot;

public class Ingredient : Resource
{
	[Export]
	public string _displayName { get; set; }

	[Export]
	public PackedScene _model { get; set; }
	
	public string _type = "ingredient";

	public Ingredient(string name, PackedScene model)
	{
		_displayName = name;
		_model = model;
	}

	public Ingredient()
	{
		_displayName = "name";
		_model = null;
	}
}
