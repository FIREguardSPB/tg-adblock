# Telegram AAD — Telegram с блокировкой рекламы / ad-blocking Telegram

**Telegram AAD** (Anti-AD) — это официальный Telegram для Android с **минимальным патчем**,
который скрывает рекламные и повторяющиеся посты в каналах.

> 🔒 **Открыто и проверяемо.** Это **не сторонний форк**. Это официальный исходный код
> [DrKLO/Telegram](https://github.com/DrKLO/Telegram) + **минимальные правки**, собранные «как есть».
> Весь патч — в одном файле [`patches/android-adblock.patch`](patches/android-adblock.patch),
> сборка идёт в публичном GitHub Actions (лог открыт). Никаких бинарных вставок — только открытый код.
>
> 🔒 **Open and auditable.** This is **not a third-party fork** — it is the official
> [DrKLO/Telegram](https://github.com/DrKLO/Telegram) source plus a **minimal patch**, built as-is.
> The entire patch is one file ([`patches/android-adblock.patch`](patches/android-adblock.patch)),
> built in public GitHub Actions (open logs). No binary blobs — only readable source.

📥 **Скачать / Download:** [**Releases**](../../releases/latest) → файл `tg-adblock-vN.apk`.

---

# 🇷🇺 По-русски

**Надоела реклама в каналах?** Казино, крипто-сигналы, «займы за 5 минут», розыгрыши айфонов?
**Достали одни и те же новости**, которые сыплются в десяток каналов одновременно?
Telegram AAD прячет это всё — прямо на телефоне, без серверов и без слежки.

## Что умеет

- 🚫 **Скрытие рекламы.** Тапни по рекламному посту → во всплывающем меню **«Заблокировать как
  рекламу»**. Пост прячется, и похожие (тот же текст / переформулированный, та же кампания) — тоже.
- 📦 **Стартовый набор правил** уже встроен — типовая реклама (казино, крипта, займы, розыгрыши)
  прячется сразу после установки.
- 🧩 **Прячет везде:** и внутри канала, и в превью списка чатов. Корректно обрабатывает альбомы
  (несколько фото), кнопки под постом и видео‑кружки.
- 📰 **Авто-скрытие дубликатов новостей между каналами.** Если одна и та же (или очень похожая)
  новость приходит в несколько каналов — показывается только **первая**, остальные прячутся
  автоматически: **без поста в канале, без уведомления и без значка непрочитанного**. Работает по
  приходу — даже если канал-источник ты не открывал.
- 👻 **Режим призрака (Ghost mode).** Скрывает твою активность: отметки «прочитано», статус «онлайн»
  / «был(а) недавно», «печатает…», просмотры постов и сторис. Включается/выключается переключателем.
- 🔄 **Авто-проверка обновлений** раз в сутки — если вышла новая версия, придёт уведомление со ссылкой.
- 🛡️ **Всё локально.** Никаких серверов и нейросетей: детект (ключевые слова + 64-битный SimHash)
  работает на устройстве, правила лежат в локальной SQLite. Ничего никуда не уходит.

## Установка

1. Скачай свежий `tg-adblock-vN.apk` из [Releases](../../releases/latest).
2. Поставь его (разреши установку из этого источника).
3. Это **отдельное приложение** («Telegram AAD») — ставится **рядом** с обычным Telegram, ничего
   не удаляя. Вход работает сразу, как в обычном Telegram.
4. Дальше обновления будет предлагать само.

## Как пользоваться

- **Заблокировать рекламу:** **тапни** по рекламному посту → во всплывающем меню выбери
  **«Заблокировать как рекламу»**. Скроется и он, и похожие.
- **Дубликаты новостей:** ничего делать не нужно — прячутся сами.
- **Порог схожести:** в меню **«три точки»** есть пункт **«Порог схожести: N%»** — тапай, чтобы
  перебрать значения (70 → 75 → … → 95%). Выше процент = строже (прячется только почти идентичное),
  ниже = агрессивнее. По умолчанию **75%**.
- **Режим призрака:** быстрый переключатель в меню **«три точки»** на главном экране
  («Режим призрака: вкл/выкл»), либо **Настройки → Конфиденциальность → «Режим призрака»**.
  Включил — твои прочтения/онлайн/«печатает» не видны; выключил — всё как обычно.
  (Учти: пока Ghost включён, твои прочтения не уходят на сервер, поэтому на других устройствах,
  например в Desktop, чаты будут висеть непрочитанными — это и есть его смысл.)

> **Примечания:**
> - Некоторые посты прячутся **не мгновенно** — иногда скрытие происходит спустя пару секунд или
>   при следующей прокрутке ленты. Это нормально.
> - Канал с дубликатом может всё равно подняться вверх в списке по времени (Telegram сортирует по
>   времени сообщения) — но **значка «новое» и уведомления не будет**.
> - Скрытая реклама и дубли помечаются **прочитанными** (на сервере), чтобы не висели
>   непрочитанными на других твоих устройствах (Desktop и т.п.).

---

# 🇬🇧 In English

**Tired of ads in your channels?** Casinos, crypto signals, "loans in 5 minutes", iPhone giveaways?
**Sick of the same news** flooding a dozen channels at once? Telegram AAD hides all of it — on your
device, with no servers and no tracking.

## Features

- 🚫 **Hide ads.** Tap an ad post → **"Block as ad"** in the popup menu. That post is hidden, and
  similar ones (same / reworded text, same campaign) are hidden too.
- 📦 **Bundled starter ruleset** — common ads (casino, crypto, loans, giveaways) are hidden right
  after install.
- 🧩 **Hidden everywhere:** inside the channel *and* in the chat-list preview. Handles albums
  (multi-photo), inline buttons, and round video notes correctly.
- 📰 **Cross-channel duplicate-news auto-hide.** When the same (or very similar) news arrives in
  several channels, only the **first** is shown; the rest are hidden automatically — **no post in the
  channel, no notification, no unread badge**. It works on message arrival, even for channels you
  never opened.
- 👻 **Ghost mode.** Hides your activity: read receipts, online / last-seen, "typing…", post views and
  story views. Toggle on/off.
- 🔄 **Daily update check** — when a new version is published, you get a notification with the link.
- 🛡️ **Fully local.** No servers, no ML: detection (keyword overlap + 64-bit SimHash) runs on-device,
  rules live in local SQLite. Nothing ever leaves your phone.

## Install

1. Download the latest `tg-adblock-vN.apk` from [Releases](../../releases/latest).
2. Install it (allow installs from this source).
3. It's a **separate app** ("Telegram AAD") that installs **alongside** the regular Telegram without
   removing it. Login works out of the box, like normal Telegram.
4. Future versions will prompt you to update automatically.

## How to use

- **Block an ad:** **tap** the ad post → choose **"Block as ad"** from the popup menu. It and similar
  posts disappear.
- **Duplicate news:** nothing to do — hidden automatically.
- **Similarity threshold:** the **three-dots menu** has a **"Similarity: N%"** item — tap to cycle
  values (70 → 75 → … → 95%). Higher = stricter (only near-identical hidden), lower = more aggressive.
  Default is **75%**.
- **Ghost mode:** a quick toggle in the **three-dots menu** on the main screen ("Ghost mode: on/off"),
  or **Settings → Privacy and Security → "Ghost mode"**. On = your reads/online/typing are hidden;
  off = stock behavior. (Note: while Ghost is on, your reads aren't sent to the server, so chats stay
  unread on your other devices like Desktop — that's the whole point.)

> **Notes:**
> - Some posts are **not hidden instantly** — hiding may happen a couple of seconds later or on the
>   next scroll of the feed. That's expected.
> - A channel with a duplicate may still rise in the chat list by time (Telegram sorts by message
>   time) — but there will be **no "new" badge and no notification**.
> - Hidden ads and duplicates are marked **read** (on the server) so they don't stay unread on your
>   other devices (Desktop, etc.).

---

# 🛠️ Сборка / Building (для разработчиков / for developers)

Минимальный патч поверх официального исходника, собирается в публичном CI. /
A minimal patch over the official source, built in public CI.

`.github/workflows/build.yml` (cron + ручной запуск / manual dispatch):

1. забирает официальный исходник DrKLO/Telegram по закреплённому коммиту /
   fetches the official DrKLO/Telegram source at the pinned commit,
2. накладывает [`patches/android-adblock.patch`](patches/android-adblock.patch) (единственный файл правок / the only changes),
3. подставляет приватный `api_id`/`api_hash` из секретов репозитория (`TG_API_ID` / `TG_API_HASH`) —
   **в коде ключа нет** / injects the private `api_id`/`api_hash` from repo secrets — **the key is not in the code**,
4. собирает `:TMessagesProj_App:assembleAfatRelease` (Android SDK 35, NDK 27) и публикует APK в **Releases** /
   builds and publishes the APK to **Releases**.

Релиз помечается версией патча (`tg-adblock-vN`), а не версией Telegram, поэтому встроенная авто-обновлялка
видит новые сборки. / Releases are tagged by the patch version (`tg-adblock-vN`), so the in-app updater
detects new builds.

APK подписан debug-ключом репозитория — **только сайдлоад**. / The APK is signed with the repo's debug
keystore — **sideload only**.

**Запуск вручную / Manual run:** Actions → *Build patched Telegram (ad-blocker)* → **Run workflow**.
