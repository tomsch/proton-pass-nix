# Proton Pass Desktop for NixOS

Unofficial Nix package for [Proton Pass Desktop](https://proton.me/pass) - the password manager desktop application.

## Installation

### Flake Input (NixOS/Home Manager)

```nix
{
  inputs.proton-pass.url = "github:tomsch/proton-pass-nix";

  outputs = { self, nixpkgs, proton-pass, ... }: {
    # NixOS
    nixosConfigurations.myhost = nixpkgs.lib.nixosSystem {
      modules = [{
        nixpkgs.config.allowUnfree = true;
        environment.systemPackages = [
          proton-pass.packages.x86_64-linux.default
        ];
      }];
    };
  };
}
```

### Direct Run (no install)

```bash
nix run github:tomsch/proton-pass-nix --impure
```

### Imperative Install

```bash
nix profile install github:tomsch/proton-pass-nix --impure
```

## Features

- Native Wayland support with automatic detection
- Electron-based desktop application
- Auto-fill capabilities
- Secure password storage with Proton's encryption

## Wayland Support

The package automatically enables Wayland support when `NIXOS_OZONE_WL=1` is set:

```bash
export NIXOS_OZONE_WL=1
```

This is typically set by NixOS desktop modules automatically.

## Update Package

Maintainers can update to the latest version:

```bash
./update.sh
```

## License

The Nix packaging is MIT. Proton Pass itself is licensed under GPL-3.0+ by Proton AG.

## Links

- [Proton Pass](https://proton.me/pass)
- [Proton Pass Download](https://proton.me/pass/download)
