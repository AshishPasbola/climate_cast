class Weather {
  final Coord coord;
  final List<WeatherCondition> weather;
  final Main main;
  final Wind wind;
  final Rain? rain;
  final Clouds clouds;
  final Sys sys;
  final String name;

  const Weather({
    this.coord=const Coord(),
    this.weather=const [],
    this.main=const Main(),
    this.wind=const Wind(),
    this.rain=const Rain(),
    this.clouds =const Clouds(),
    this.sys=const Sys(),
    this.name='',
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      coord: Coord.fromJson(json['coord']),
      weather: (json['weather'] as List)
          .map((i) => WeatherCondition.fromJson(i))
          .toList(),
      main: Main.fromJson(json['main']),
      wind: Wind.fromJson(json['wind']),
      rain: json['rain'] != null ? Rain.fromJson(json['rain']) : null,
      clouds: Clouds.fromJson(json['clouds']),
      sys: Sys.fromJson(json['sys']),
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'coord': coord.toJson(),
      'weather': weather.map((i) => i.toJson()).toList(),
      'main': main.toJson(),
      'wind': wind.toJson(),
      'rain': rain?.toJson(),
      'clouds': clouds.toJson(),
      'sys': sys.toJson(),
      'name': name,
    };
  }
}

class Coord {
  final double lon;
  final double lat;

  const Coord({
    this.lon=0.0,
    this.lat=0.0,

  });

  factory Coord.fromJson(Map<String, dynamic> json) {
    return Coord(
      lon: json['lon'].toDouble(),
      lat: json['lat'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'lon': lon,
      'lat': lat,
    };
  }
}

class WeatherCondition {
  final int id;
  final String main;
  final String description;
  final String icon;

  WeatherCondition({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  factory WeatherCondition.fromJson(Map<String, dynamic> json) {
    return WeatherCondition(
      id: json['id'],
      main: json['main'],
      description: json['description'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }
}

class Main {
  final double temp;
  final double feelsLike;
  final double tempMin;
  final double tempMax;
  final int pressure;
  final int humidity;
  final int seaLevel;
  final int grndLevel;

  const Main({
    this.temp=0.0,
    this.feelsLike=0.0,
    this.tempMin=0.0,
    this.tempMax=0,
    this.pressure=0,
    this.humidity=0,
    this.seaLevel=0,
    this.grndLevel=0,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      feelsLike: json['feels_like'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      pressure: json['pressure'],
      humidity: json['humidity'],
      seaLevel: json['sea_level'],
      grndLevel: json['grnd_level'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel,
    };
  }
}

class Wind {
  final double speed;
  final int deg;
  //final double gust;

  const Wind({
    this.speed=0.0,
    this.deg=0,
    //  this.gust=0
  });

  factory Wind.fromJson(Map<String, dynamic> json) {
    return Wind(
      speed: json['speed'].toDouble(),
      deg: json['deg'],
      //   gust: json['gust'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'speed': speed,
      'deg': deg,
      //'gust': gust,
    };
  }
}

class Rain {
  final double oneHour;

  const Rain({ this.oneHour=0.0});

  factory Rain.fromJson(Map<String, dynamic> json) {
    return Rain(
      oneHour: json['1h'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '1h': oneHour,
    };
  }
}

class Clouds {
  final int all;

  const Clouds({ this.all=0});

  factory Clouds.fromJson(Map<String, dynamic> json) {
    return Clouds(
      all: json['all'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'all': all,
    };
  }
}

class Sys {
  // final int type;
  // final int id;
  final String country;
  final int sunrise;
  final int sunset;

  const Sys({
    // this.type=0,
    // this.id=0,
    this.country="",
    this.sunrise=0 ,
    this.sunset=0,
  });

  factory Sys.fromJson(Map<String, dynamic> json) {
    return Sys(
      // type: json['type'],
      // id: json['id'],
      country: json['country'],
      sunrise: json['sunrise'],
      sunset: json['sunset'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      // 'type': type,
      // 'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset,
    };
  }
}
