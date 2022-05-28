using Godot;
using System;

public class GridSpace
{
	private Vector2 position;
	private Node obj;


	public GridSpace(Vector2 pos, Node o)
	{
		position = pos;
		obj = o;
	}

	public void DestroyNode()
	{
		obj.QueueFree();
	}


	public Vector2 GridPosition()
	{
		return position;
	}

	public Vector2 AbsolutePosition()
	{
		return 100 * position;
	}

	public Node Object()
	{
		return obj;
	}

}
