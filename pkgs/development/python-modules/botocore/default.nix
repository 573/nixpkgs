{ lib
, buildPythonPackage
, fetchPypi
, python-dateutil
, jmespath
, docutils
, simplejson
, mock
, nose
, urllib3
}:

buildPythonPackage rec {
  pname = "botocore";
  version = "1.27.96"; # N.B: if you change this, change boto3 and awscli to a matching version

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-/AoT72BC6JDjYc9Ah1kjD4V0QJu1H4F0DS5ditXR++o=";
  };

  propagatedBuildInputs = [
    python-dateutil
    jmespath
    docutils
    simplejson
    urllib3
  ];

  checkInputs = [ mock nose ];

  checkPhase = ''
    nosetests -v
  '';

  # Network access
  doCheck = false;

  pythonImportsCheck = [ "botocore" ];

  meta = with lib; {
    homepage = "https://github.com/boto/botocore";
    license = licenses.asl20;
    description = "A low-level interface to a growing number of Amazon Web Services";
  };
}
