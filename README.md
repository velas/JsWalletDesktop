Ethnamed Electron Desktop


[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-black.svg)](https://snapcraft.io/velas-desktop-wallet)

### Install Desktop Wallet

1. git clone https://github.com/velas/JsWalletDesktop.git
2. cd ./JsWalletDesktop
3. sh update (You must have already cloned web wallet. Update command clone web wallet in desktop dir)
4. yarn run build-wallet

### Run wallet locally

1. yarn run start

### Releasing

When you want to create a new release, follow these steps:

1. Update the version in your project's `package.json` file (e.g. `1.2.3`)
2. Commit that change (`git commit -am v1.2.3`)
3. Tag your commit (`git tag v1.2.3`). Make sure your tag name's format is `v*.*.*`. Your workflow will use this tag to detect when to create a release
4. Push your changes to GitHub (`git push && it push origin v1.2.3`)

After building successfully, the action will publish your release artifacts. By default, a new release draft will be created on GitHub with download links for your app. If you want to change this behavior, have a look at the [`electron-builder` docs](https://www.electron.build).

Tested with `node --version` v14.16.1
