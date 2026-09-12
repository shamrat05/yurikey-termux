# Yurikey Easy

Termux + root helper for installing a selected Tricky Store `keybox.xml`.

What it does:

- Opens Android file picker through `termux-storage-get` when Termux:API is installed; otherwise asks for a path.
- Validates basic XML structure without printing private keys.
- Backs up existing `keybox.xml` and `target.txt`.
- Installs selected XML at `/data/adb/tricky_store/keybox.xml`.
- Writes only installed packages from fixed allowlist to `/data/adb/tricky_store/target.txt`.
- Force-stops and clears cache for Google Play Services, GSF, and Play Store.
- Prompts before clearing Google data.
- Prompts before reboot.

## Install

```sh
git clone https://github.com/shamrat05/yurikey-termux.git
cd yurikey-termux
./install.sh
keybox
```

One-command remote install:

```sh
curl -fsSL https://raw.githubusercontent.com/shamrat05/yurikey-termux/main/install.sh | sh -s -- --remote
```

After install, `keybox` launches tool globally. `yurikey-easy` remains available too.

For picker support, install the Termux:API companion app from the same source/signing build as Termux, then run:

```sh
pkg install termux-api
```

Without Termux:API, tool accepts direct path input, for example:

```text
/storage/emulated/0/Download/Telegram/Yurikey59.xml
```

## Scope

Allowlist includes Google core, Wallet, selected banking/payment apps, ChatGPT, WhatsApp, and WhatsApp Business. Packages absent from device are omitted automatically. It never adds every installed system app.

## Safety

Keybox XML contains private attestation keys. Keep it private. Backups remain under `/data/adb/tricky_store/`.

Tool does not claim that a keybox is valid or unrevoked. Verify Play Store certification after applying.
