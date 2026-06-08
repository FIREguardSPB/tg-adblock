# tg-adblock — patched Telegram for Android (auto-build)

Client-side ad-blocker for Telegram channels, built as a patch over the official
[DrKLO/Telegram](https://github.com/DrKLO/Telegram) sources (no third-party fork).

- Long-press a channel post → **"Заблокировать как рекламу"**. The post is hidden,
  and similar posts (near-duplicate / reworded same campaign) are hidden too.
- Detection = keyword overlap + sender/domain context + 64-bit SimHash, all local.
  No ML, no server, rules stored in on-device SQLite.
- A starter ruleset is bundled, so common ads are hidden on first launch.

## Automated builds

`.github/workflows/build.yml` runs every 6 hours (and on manual dispatch):

1. resolves the latest `release-*` tag of DrKLO/Telegram (or a ref you pass),
2. applies [`patches/android-adblock.patch`](patches/android-adblock.patch),
3. builds `:TMessagesProj_App:assembleAfatRelease` (Android SDK 35, NDK 27),
4. publishes the signed APK to **Releases**.

If upstream changes the hooked files and the patch no longer applies, the run
**fails on purpose** (it does not publish a broken build) — re-anchor the patch
and re-run. The APK is signed with the repo's debug keystore: **sideload only**.

## Manual run

Actions → *Build patched Telegram (ad-blocker)* → **Run workflow**. With the
default ref it builds the exact base the patch is pinned to; leave empty on a
schedule to track the latest release.
