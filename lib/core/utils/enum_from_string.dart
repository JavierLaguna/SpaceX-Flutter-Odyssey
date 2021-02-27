T enumFromString<T>(String key, List<T> values) =>
    values.firstWhere((v) => key == v.toString(), orElse: () => null);
