{
  lib,
  stdenvNoCC,
  fetchurl,
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "plannotator";
  version = "0.27.21";

  src = fetchurl {
    url = "https://github.com/backnotprop/plannotator/releases/download/v${finalAttrs.version}/plannotator-linux-x64";
    hash = "sha256-mxtKO58JL+gX6/Aqp2OLGAsfW0UVIPWA4xSVrMryMwU=";
  };

  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    install -Dm755 "$src" "$out/bin/plannotator"
    runHook postInstall
  '';

  meta = {
    description = "Interactive plan and code review tool for AI coding agents";
    homepage = "https://github.com/backnotprop/plannotator";
    license = with lib.licenses; [
      mit
      asl20
    ];
    sourceProvenance = with lib.sourceTypes; [ binaryNativeCode ];
    mainProgram = "plannotator";
    platforms = [ "x86_64-linux" ];
  };
})
