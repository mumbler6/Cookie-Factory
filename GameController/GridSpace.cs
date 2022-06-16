using Godot;

public class GridSpace
{
    private Vector2 position;
    private Node2D obj;


    public GridSpace(Vector2 pos, Node2D o)
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

    public Node2D Object()
    {
        return obj;
    }

}
