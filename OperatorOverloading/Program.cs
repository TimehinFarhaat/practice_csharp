using System;

public class Box
{
    private int Lenght;
    private int Width;
    private int Height;

    public Box(int Lenght, int Width, int Height)
    {
        this.Lenght = Lenght;
        this.Width = Width;
        this.Height = Height;
    }

    public int GetLength()
    {
        return Lenght;
    }
    public int GetWidth()
    {
        return Width;
    }
    public int GetHeight()
    {
        return Height;
    }

    public static Box operator +(Box a, Box b)
    {
        return new Box(a.GetLength() + b.GetLength(), a.GetWidth()
            + b.GetWidth(), a.GetHeight() + b.GetHeight());
    }
}

public class Program
{
    public static void Main(string[] args)
    {
        Box box1 = new Box(2, 3, 5);
        Box box2 = new Box(4, 5, 6);
        Box box3 = box1 + box2;
        System.Diagnostics.Debug.WriteLine($"  Length: {box3.GetLength()}\n" +
                          $"  Width : {box3.GetWidth()}\n" +
                          $"  Heigth: {box3.GetHeight()}");

    }
}