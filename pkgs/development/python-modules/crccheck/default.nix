{ lib, buildPythonPackage, fetchPypi, isPy3k
, nose }:

let
  pname = "crccheck";
  version = "1.1.1";
in buildPythonPackage {
  inherit pname version;

  checkInputs = [ nose ];

  src = fetchPypi {
    inherit pname version;
    sha256 = "sha256-FElOr7qF3jygAvxS6kpk1pjN3fqRREKXMOdV58FDCVY=";
  };

  disabled = !isPy3k;

  meta = with lib; {
    description = "Python library for CRCs and checksums";
    homepage = "https://sourceforge.net/projects/crccheck/";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ ];
    platforms = platforms.linux;
  };
}
