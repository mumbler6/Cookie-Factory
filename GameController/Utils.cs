using Godot;
using System;

public class Utils : Node
{
	// Called when the node enters the scene tree for the first time.

	public static Vector2 RoundToNearest100(Vector2 vec)
	{
		return new Vector2(RoundToNearest100(vec.x), RoundToNearest100(vec.y));
	}

	public static int RoundToNearest100(float num)
	{
		if (num < 0 ^ Mathf.Abs(num % 100) < 50)
		{
			return 100 * Mathf.FloorToInt(num / 100f);
		}
		else
		{
			return 100 * Mathf.CeilToInt(num / 100f);
		}
	}
}
