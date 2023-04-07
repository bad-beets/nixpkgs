{ lib
, buildPythonPackage
, python
, pytestCheckHook
, pythonOlder
, ruamel-yaml
, unidecode
, pyyaml
}:

buildPythonPackage rec {
  pname = "gogh";
  version = "242";
  format = "pyproject";

  disabled = pythonOlder "3.6";

  src = sourcehut:lavender/Gogh;
  };

  nativeBuildInputs = [
    ruamel-yaml
    unidecode
    pyyaml
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "gogh"
  ];

  meta = with lib; {
    description = "a collection of color schemes for various terminal emulators";
    homepage = "https://sr.ht/~lavender/gogh";
    license = licenses.free;
    platforms = platforms.unix;
  };
}
