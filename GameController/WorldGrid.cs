using Godot;
using System.Collections.Generic;

public class WorldGrid : Node
{
	private static Dictionary<Vector2, GridSpace> gridSpaces = new Dictionary<Vector2, GridSpace>();



	public static bool GridSpaceExists(Vector2 position)
	{
		Vector2 gridPosition = Utils.RoundToNearest100(position);
		return gridSpaces.ContainsKey(gridPosition);
	}

	public static GridSpace FindNearestGridSpace(Vector2 position) // finds closest grid space given coordinates, return null if not
	{
		if (GridSpaceExists(position))
		{
			Vector2 gridPosition = Utils.RoundToNearest100(position);
			return gridSpaces[gridPosition];
		}
		return null;
	}

	public static void DeleteSpace(GridSpace gridSpace)
	{
		Vector2 position = gridSpace.GridPosition();
		if (GridSpaceExists(position))
		{
			gridSpace.DestroyNode();
			gridSpaces.Remove(position);
		}
	}

	public static void DeleteSpace(Vector2 position)
	{
		if (GridSpaceExists(position))
		{
			GridSpace g = FindNearestGridSpace(position);
			g.DestroyNode();
			gridSpaces.Remove(position);
		}
	}
	
	// depreciated
	public static bool AddSpace(GridSpace gridSpace)
	{
		Vector2 position = gridSpace.GridPosition();
		if (!GridSpaceExists(position))
		{
			gridSpaces.Add(position, gridSpace);
			return true;
		}
		return false;
	}
	
	// depreciated
	public static bool AddSpace(Vector2 position, Node2D obj)
	{
		if (!GridSpaceExists(position))
		{
			gridSpaces.Add(position, new GridSpace(position, obj));
			return true;
		}
		return false;
	}
	
	public static bool TryPlaceObject(Vector2 position, Vector2 footprint, Node2D obj)
	{
		// check for position validity
		for (int xOffset = 0; xOffset < footprint.x; xOffset++)
		{
			for (int yOffset = 0; yOffset < footprint.y; yOffset++)
			{
				if (GridSpaceExists(position + 100 * new Vector2(xOffset, yOffset)))
				{
					return false;
				}
			}
		}
		// add grid spaces
		for (int xOffset = 0; xOffset < footprint.x; xOffset++)
		{
			for (int yOffset = 0; yOffset < footprint.y; yOffset++)
			{
				Vector2 offsetPosition = position + 100 * new Vector2(xOffset, yOffset);
				gridSpaces.Add(offsetPosition, new GridSpace(offsetPosition, obj));
			}
		}
		return true;
	}
	/*
		public Dictionary<string, GridSpace> FindAdjacentOccupied(Vector3 position) // add overload for currplacingobject case!!!!!
		{
			Vector3 centerBlock = Utils.RoundToNearestTen(position);
			Dictionary<string, GridSpace> adjSpaces = new Dictionary<string, GridSpace>();

			adjSpaces.Add("east",  FindNearestGridSpace(new Vector3(centerBlock.x + 10, centerBlock.y,      centerBlock.z)));
			adjSpaces.Add("west",  FindNearestGridSpace(new Vector3(centerBlock.x - 10, centerBlock.y,      centerBlock.z)));
			adjSpaces.Add("up",    FindNearestGridSpace(new Vector3(centerBlock.x,      centerBlock.y + 10, centerBlock.z)));
			adjSpaces.Add("down",  FindNearestGridSpace(new Vector3(centerBlock.x,      centerBlock.y - 10, centerBlock.z)));
			adjSpaces.Add("north", FindNearestGridSpace(new Vector3(centerBlock.x,      centerBlock.y,      centerBlock.z + 10)));
			adjSpaces.Add("south", FindNearestGridSpace(new Vector3(centerBlock.x,      centerBlock.y,      centerBlock.z - 10)));

			Dictionary<string, GridSpace> adjSpacesTrimmed = new Dictionary<string, GridSpace>();
			foreach (KeyValuePair<string, GridSpace> entry in adjSpaces)
			{ 
				if (entry.Value != null)
				{
					adjSpacesTrimmed.Add(entry.Key, entry.Value);
				}
			}

			return adjSpacesTrimmed;
		}
		*/
}
