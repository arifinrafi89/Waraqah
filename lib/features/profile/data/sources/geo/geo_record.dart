/// A district as the fake backend keeps it: (name, Bangla name, upazilas).
typedef GeoDistrictRecord = (String, String, List<String>);

/// A division: (name, Bangla name, districts).
typedef GeoDivisionRecord = (String, String, List<GeoDistrictRecord>);
