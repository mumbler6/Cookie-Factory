using Godot;
using System.Collections.Generic;


public class BuildHandler : Node2D
{
	Node2D ghostInstance;

	[Export]
	public PackedScene ghostPre;

	[Export]
	public List<PlacableObject> buildList;

	[Export]
	public float placingCooldown = 0.5f;
	private float placingCooldownCounter = 0f;

	public override void _Ready()
	{
		if (ghostPre == null || buildList.Count == 0)
		{
			GD.PushError("missing ghostPre or buildList items");
		}
		Node n = ghostPre.Instance();
		ghostInstance = new Node2D();
		ghostInstance.AddChild(n);
		AddChild(ghostInstance);

	}





	public override void _Process(float delta)
	{
		// ensures spam placing not possible
		if (placingCooldownCounter > 0)
		{
			placingCooldownCounter -= delta;
		}
		Vector2 mousePos = GetGlobalMousePosition();
		Vector2 nearestGrid = Utils.RoundToNearest100(mousePos);
		ghostInstance.Position = nearestGrid;

		if (Input.IsActionJustPressed("left_click") && placingCooldownCounter <= 0)
		{
			placingCooldownCounter = placingCooldown;
			Node _objectInstance = buildList[0]._model.Instance();
			Node2D objectInstanceContainer = new Node2D();
			objectInstanceContainer.AddChild(_objectInstance);
			AddChild(objectInstanceContainer);
			objectInstanceContainer.Position = nearestGrid;

			if (WorldGrid.AddSpace(nearestGrid, objectInstanceContainer))
			{
				GD.Print("added object at " + nearestGrid.ToString());
			}
			else
			{
				GD.Print("failed to add object at " + nearestGrid.ToString() + ", space taken");
			}
		}
	}

}
