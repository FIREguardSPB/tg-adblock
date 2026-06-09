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

1. resolves the upstream ref — the pinned base commit by default, or a ref you
   pass on manual dispatch,
2. applies [`patches/android-adblock.patch`](patches/android-adblock.patch),
3. builds `:TMessagesProj_App:assembleAfatRelease` (Android SDK 35, NDK 27),
4. publishes the signed APK to **Releases** (skips if that ref is already built).

> **Why not "latest release tag"?** DrKLO develops on `master` but their newest
> GitHub *tag* is `release-11.4.2-5469` — far behind the 12.x the patch targets.
> Auto-resolving the latest tag checked out an *older* tree than the patch's base,
> so the patch failed to apply and scheduled runs errored out. The schedule now
> rebuilds the pinned base (a no-op once released). To track a newer upstream,
> dispatch with an explicit `ref` and re-anchor the patch if it no longer applies.

If upstream changes the hooked files and the patch no longer applies, the run
**fails on purpose** (it does not publish a broken build) — re-anchor the patch
and re-run. The APK is signed with the repo's debug keystore: **sideload only**.

## Manual run

Actions → *Build patched Telegram (ad-blocker)* → **Run workflow**. With the
default ref it builds the exact base the patch is pinned to; pass an explicit
ref (tag or commit) to build a newer upstream.
