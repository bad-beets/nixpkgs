{ lib
, buildGoModule
, fetchFromGitHub
}:

buildGoModule rec {
  pname = "desync";
  version = "0.9.4";

  src = fetchFromGitHub {
    owner = "folbricht";
    repo = "desync";
    rev = "refs/tags/v${version}";
    hash = "sha256-kwYRspzfTBl9FtPrpd55VBYiCzaG7M83EM5nbqdBG/Q=";
  };

  vendorHash = "sha256-1RuqlDU809mtGn0gOFH/AW6HJo1cQqt8spiLp3/FpcI=";

  # nix builder doesn't have access to test data; tests fail for reasons unrelated to binary being bad.
  doCheck = false;

  meta = with lib; {
    description = "Content-addressed binary distribution system";
    longDescription = "An alternate implementation of the casync protocol and storage mechanism with a focus on production-readiness";
    homepage = "https://github.com/folbricht/desync";
    changelog = "https://github.com/folbricht/desync/releases/tag/v${version}";
    license = licenses.bsd3;
    maintainers = with maintainers; [ chaduffy ];
  };
}
