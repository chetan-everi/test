using System;

namespace HelloWorldApp
{
    class Program
    {
        static void Main(string[] args)
        {
            // Output "Hello, World!" to the console
            Console.WriteLine("Hello, World!");

            // Request user input
            Console.WriteLine("Enter your name: ");
            string name = Console.ReadLine();

            // Output a personalized message
            Console.WriteLine($"Hello, {name}! Welcome to C# programming.");

            // Wait for the user to press any key before closing
            Console.WriteLine("Press any key to exit.");
            Console.ReadKey();
        }
    }
}
