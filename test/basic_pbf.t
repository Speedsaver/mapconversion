  $ [ "$0" != "/bin/bash" ] || shopt -s expand_aliases
  $ [ -n "$PYTHON" ] || PYTHON="`which python`"
  $ alias ogr2pbf="PYTHONPATH=$TESTDIR/.. $PYTHON -m ogr2pbf"
  $ alias osmosis=$TESTDIR/../../osmosis/bin/osmosis

test1pbf:
  $ ogr2pbf -f $TESTDIR/shapefiles/test1.shp
  Using default translations
  Preparing to convert .* (re)
  Detected projection metadata:
  PROJCS["NAD83 / UTM zone 10N",
      GEOGCS["NAD83",
          DATUM["North_American_Datum_1983",
              SPHEROID["GRS 1980",6378137,298.257222101,
                  AUTHORITY["EPSG","7019"]],
              AUTHORITY["EPSG","6269"]],
          PRIMEM["Greenwich",0,
              AUTHORITY["EPSG","8901"]],
          UNIT["degree",0.0174532925199433,
              AUTHORITY["EPSG","9122"]],
          AUTHORITY["EPSG","4269"]],
      PROJECTION["Transverse_Mercator"],
      PARAMETER["latitude_of_origin",0],
      PARAMETER["central_meridian",-123],
      PARAMETER["scale_factor",0.9996],
      PARAMETER["false_easting",500000],
      PARAMETER["false_northing",0],
      UNIT["metre",1,
          AUTHORITY["EPSG","9001"]],
      AXIS["Easting",EAST],
      AXIS["Northing",NORTH],
      AUTHORITY["EPSG","26910"]]
  Merging points
  Making list
  Checking list
  Merging duplicate points in ways
  Splitting long ways
  Writing file header
  Writing blob, type = OSMHeader
  Writing nodes
  Primitive block generation
  Writing blob, type = OSMData
  Writing ways
  Primitive block generation
  Writing blob, type = OSMData
  Writing relations
  $ osmosis --read-pbf file=test1.osm.pbf --write-xml test1.osm 2> /dev/null
  $ xmllint --format test1.osm | diff -uNr - $TESTDIR/test1.pbf.xml

versionpbf:
  $ ogr2pbf -f --add-version $TESTDIR/shapefiles/test1.shp
  Using default translations
  Preparing to convert .* (re)
  Detected projection metadata:
  PROJCS["NAD83 / UTM zone 10N",
      GEOGCS["NAD83",
          DATUM["North_American_Datum_1983",
              SPHEROID["GRS 1980",6378137,298.257222101,
                  AUTHORITY["EPSG","7019"]],
              AUTHORITY["EPSG","6269"]],
          PRIMEM["Greenwich",0,
              AUTHORITY["EPSG","8901"]],
          UNIT["degree",0.0174532925199433,
              AUTHORITY["EPSG","9122"]],
          AUTHORITY["EPSG","4269"]],
      PROJECTION["Transverse_Mercator"],
      PARAMETER["latitude_of_origin",0],
      PARAMETER["central_meridian",-123],
      PARAMETER["scale_factor",0.9996],
      PARAMETER["false_easting",500000],
      PARAMETER["false_northing",0],
      UNIT["metre",1,
          AUTHORITY["EPSG","9001"]],
      AXIS["Easting",EAST],
      AXIS["Northing",NORTH],
      AUTHORITY["EPSG","26910"]]
  Merging points
  Making list
  Checking list
  Merging duplicate points in ways
  Splitting long ways
  Writing file header
  Writing blob, type = OSMHeader
  Writing nodes
  Primitive block generation
  Writing blob, type = OSMData
  Writing ways
  Primitive block generation
  Writing blob, type = OSMData
  Writing relations
  $ osmosis --read-pbf file=test1.osm.pbf --write-xml test1.osm 2> /dev/null
  $ xmllint --format test1.osm | diff -uNr - $TESTDIR/version.pbf.xml

