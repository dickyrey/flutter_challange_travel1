class LocationModel {
  final String name;
  final String location;
  final double rating;
  final String estimate;
  final String description;
  final double price;
  final String image;
  LocationModel({
    this.name,
    this.location,
    this.rating,
    this.estimate,
    this.description,
    this.price,
    this.image,
  });
}

List<LocationModel> locationList = [
  LocationModel(
      name: 'Eiffel Tower',
      location: 'Champ de Mars, 5 Avenue Anatole France, 75007 Paris, Prancis',
      rating: 4.9,
      price: 247.42,
      estimate: '2 to 3 hrs',
      image: 'assets/1.jpg',
      description:
          "The most visited tourist attraction in Paris, the Eiffel Tower also ranks high on the list of places to visit in France. It's hard to believe that the structure was dismissed as a monstrosity when it was first unveiled. The iconic tower was designed by Alexandre-Gustave Eiffel for the Paris Exhibition of 1889, which marked the centenary of the French Revolution."),
  LocationModel(
    name: 'Musée du Louvre',
    location: 'Rue de Rivoli, 75001 Paris, Prancis',
    rating: 4.5,
    price: 200.22,
    estimate: '2 to 3 hrs',
    image: 'assets/2.jpg',
    description:
        "A sumptuous palace that was once the home of France's Kings, the Louvre is the most important of Paris' top museums. Visitors enter the museum in the courtyard of the palace at the glass pyramid (designed by Ieoh Ming Pei in 1917). The Louvre Museum possesses more than 30,000 artworks (many considered masterpieces)—from antiquities to European paintings of the 15th to 19th centuries.",
  ),
  LocationModel(
    name: 'Cathédrale Notre-Dame de Paris',
    location: '6 Parvis Notre-Dame - Pl. Jean-Paul II, 75004 Paris, France',
    rating: 4.3,
    price: 240.22,
    estimate: '2 to 3 hrs',
    image: 'assets/3.jpg',
    description:
        "A triumph of Gothic architecture, the Notre-Dame stands in the heart of Paris on the Ile de la Cité near the attractions of the Latin Quarter. An island in the Seine River, the Ile de la Cité is the historical and geographical center of Paris. On this small plot of land, the Romans built the Gallo-Roman city of Lutetia, and from the 6th century to the 14th century, the Kings of France resided here.",
  ),
  LocationModel(
    name: 'Avenue des Champs-Élysées',
    location: '10 avenue des champs Elysées 75008, Paris',
    rating: 4.3,
    price: 200.22,
    estimate: '2 to 3 hrs',
    image: 'assets/4.jpg',
    description:
        "The most monumental boulevard in Paris used to be a desolate field of marshland until the 17th century, when it was landscaped by André Le Nôtre. A century later, the renowned Parisian city planner Baron Haussman designed the boulevard's elegant buildings. The Champs-Elysées is divided into two parts with the Rond-Point des Champs-Elysées as its intersection.",
  ),
  LocationModel(
    name: "Musée d'Orsay",
    location: "1 Rue de la Légion d'Honneur, 75007 Paris, Prancis",
    rating: 4.6,
    price: 300.22,
    estimate: '2 to 3 hrs',
    image: 'assets/5.jpg',
    description:
        "This splendid collection of Impressionist art is beautifully presented in an expansive space (formerly the Belle Epoque-era Gare d'Orsay railway station). The collection represents the work of all the masters of Impressionism. The artists range from classic Impressionist masters Edgar Degas, Edouard Manet, Claude Monet, and Pierre-August Renoir to Post-Impressionist artists such as Pierre Bonnard, Paul Cézanne, and Vincent van Gogh; the Pointillists (Georges Seurat, Paul Signac); and Bohemian artists like Toulouse Lautrec.",
  ),
];
