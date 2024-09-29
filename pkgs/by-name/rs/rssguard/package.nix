{
  lib,
  stdenv,
  fetchFromGitHub,
  cmake,
  mpv,
  qt6,
  wrapGAppsHook,
}:

stdenv.mkDerivation rec {
  pname = "rssguard";
  version = "4.7.4";

  src = fetchFromGitHub {
    owner = "martinrotter";
    repo = "rssguard";
    rev = version;
    hash = "sha256-5c9J9Au/9TfKtabZ44wwTMF678nltDqy9yMcogqySJs=";
  };

  buildInputs = [
    qt6.qtbase
    qt6.qttools
    qt6.qtmultimedia
    qt6.qtwebengine
    qt6.qt5compat
    qt6.qtwayland
    mpv
  ];

  nativeBuildInputs = [
    cmake
    wrapGAppsHook
    qt6.wrapQtAppsHook
  ];

  qmakeFlags = [ "CONFIG+=release" ];

  meta = with lib; {
    description = "Simple RSS/Atom feed reader with online synchronization";
    mainProgram = "rssguard";
    longDescription = ''
      RSS Guard is a simple, light and easy-to-use RSS/ATOM feed aggregator
      developed using Qt framework and with online feed synchronization support
      for ownCloud/Nextcloud.
    '';
    homepage = "https://github.com/martinrotter/rssguard";
    changelog = "https://github.com/martinrotter/rssguard/releases/tag/${version}";
    license = licenses.gpl3Plus;
    platforms = platforms.linux;
    maintainers = with maintainers; [ jluttine ];
  };
}
