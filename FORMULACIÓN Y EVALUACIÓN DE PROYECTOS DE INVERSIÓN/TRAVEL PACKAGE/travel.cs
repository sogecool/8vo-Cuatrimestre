// Producto final: Paquete de Viaje
public class TravelPackage
{
    public string Transport { get; set; }
    public string Accommodation { get; set; }
    public List<string> Activities { get; set; } = new();

    public override string ToString()
    {
        return $"Transport: {Transport}, Accommodation: {Accommodation}, Activities: {string.Join(", ", Activities)}";
    }
}

// Interfaz Builder
public interface ITravelPackageBuilder
{
    void SetTransport(string transport);
    void SetAccommodation(string accommodation);
    void AddActivity(string activity);
    TravelPackage GetPackage();
}

// Concrete Builder: Paquete Económico
public class EconomyTravelPackageBuilder : ITravelPackageBuilder
{
    private TravelPackage _package = new();

    public void SetTransport(string transport) => _package.Transport = transport;
    public void SetAccommodation(string accommodation) => _package.Accommodation = accommodation;
    public void AddActivity(string activity) => _package.Activities.Add(activity);
    public TravelPackage GetPackage() => _package;
}

// Concrete Builder: Paquete Premium
public class PremiumTravelPackageBuilder : ITravelPackageBuilder
{
    private TravelPackage _package = new();

    public void SetTransport(string transport) => _package.Transport = transport;
    public void SetAccommodation(string accommodation) => _package.Accommodation = accommodation;
    public void AddActivity(string activity) => _package.Activities.Add(activity);
    public TravelPackage GetPackage() => _package;
}

// Director
public class TravelAgent
{
    private readonly ITravelPackageBuilder _builder;

    public TravelAgent(ITravelPackageBuilder builder)
    {
        _builder = builder;
    }

    public void BuildEconomyPackage()
    {
        _builder.SetTransport("Bus");
        _builder.SetAccommodation("Standard Hotel");
        _builder.AddActivity("City Tour");
    }

    public void BuildPremiumPackage()
    {
        _builder.SetTransport("Airplane");
        _builder.SetAccommodation("Luxury Resort");
        _builder.AddActivity("Snorkeling");
        _builder.AddActivity("Private Island Tour");
    }

    public TravelPackage GetPackage() => _builder.GetPackage();
}

// Ejecución
public class Program
{
    public static void Main()
    {
        // Construyendo un paquete económico
        var economyBuilder = new EconomyTravelPackageBuilder();
        var travelAgent = new TravelAgent(economyBuilder);

        travelAgent.BuildEconomyPackage();
        var economyPackage = travelAgent.GetPackage();
        Console.WriteLine("Economy Package:");
        Console.WriteLine(economyPackage);

        // Construyendo un paquete premium
        var premiumBuilder = new PremiumTravelPackageBuilder();
        travelAgent = new TravelAgent(premiumBuilder);

        travelAgent.BuildPremiumPackage();
        var premiumPackage = travelAgent.GetPackage();
        Console.WriteLine("\nPremium Package:");
        Console.WriteLine(premiumPackage);
    }
}
