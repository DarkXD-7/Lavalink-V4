# 🎵 Dark Lavalink V4

> **Premium Lavalink V4 node — built and maintained by Dark (SynthX Development)**
> Optimized for Railway.app · Max audio quality · All plugins included

---

## ⚠️ Copyright Notice

This Lavalink setup is made by **Dark (SynthX Development)**.

- ✅ You can use this for your personal or public Discord bots — for free.
- ✅ You can fork and modify it for your own use.
- ❌ If you make a **video, tutorial, stream, or public post** showcasing this setup — you **must** give credit:
  > *"Lavalink setup by Dark — github.com/SynthXDev/dark-lavalink"*
- ❌ Redistribution as your own work without credit is not allowed.

---

## ✨ Features

| Feature | Status |
|---|---|
| Lavalink V4 (latest) | ✅ |
| Spotify search + playback | ✅ via LavaSrc |
| Apple Music | ✅ via LavaSrc |
| Deezer (high quality) | ✅ via LavaSrc |
| Yandex Music | ✅ via LavaSrc |
| YouTube + YouTube Music | ✅ |
| SoundCloud | ✅ |
| HTTP/Direct URL playback | ✅ |
| Enhanced search (LavaSearch) | ✅ |
| SponsorBlock (skip YouTube ads) | ✅ |
| 8D Audio / Rotation filter | ✅ |
| Equalizer / Bass Boost | ✅ |
| Karaoke / Vocal Remove | ✅ |
| Speed / Pitch / Rate control | ✅ |
| Max Opus encoding quality (10/10) | ✅ |
| Auto-restart on crash | ✅ |
| Java 21 (LTS, best performance) | ✅ |
| Railway optimized | ✅ |

---

## 🚀 Deploy on Railway (Step by Step)

### Step 1 — Fork this repo

1. Go to this GitHub repo
2. Click **Fork** (top right) → Fork to your account
3. Your fork URL will be: `github.com/YOUR_USERNAME/dark-lavalink`

---

### Step 2 — Create Railway project

1. Go to **[railway.app](https://railway.app)** and sign in (use GitHub login)
2. Click **New Project**
3. Choose **Deploy from GitHub repo**
4. Select your forked `dark-lavalink` repo
5. Railway will detect the `Dockerfile` automatically — click **Deploy**

---

### Step 3 — Set environment variables

In your Railway project, click your service → **Variables** tab → Add these:

#### Required:
| Variable | Value | Where to get it |
|---|---|---|
| `LAVALINK_PASSWORD` | Any strong password you make up | Example: `MySecretPass123` |

#### Optional but recommended (adds Spotify, Apple Music, Deezer):
| Variable | Value | Where to get it |
|---|---|---|
| `SPOTIFY_CLIENT_ID` | Your Spotify app client ID | [developer.spotify.com](https://developer.spotify.com/dashboard) → Create App |
| `SPOTIFY_CLIENT_SECRET` | Your Spotify app secret | Same place |
| `APPLE_MUSIC_TOKEN` | Apple Music token | [developer.apple.com](https://developer.apple.com) → MusicKit (optional) |
| `YANDEX_TOKEN` | Yandex Music token | Optional |

> **Note:** Even without Spotify credentials, YouTube Music search (ytmsearch) works perfectly.

---

### Step 4 — Get your Railway URL

1. In Railway, click your service → **Settings** tab
2. Under **Networking**, click **Generate Domain**
3. Your URL will look like: `dark-lavalink-production.up.railway.app`
4. Your Lavalink host is that URL (without `https://`)

---

### Step 5 — Connect your Discord bot

In your bot's config file (e.g. `Suzume/config.js`), set:

```js
LAVALINK: {
    HOSTS:     'dark-lavalink-production.up.railway.app',
    PORTS:     '443',
    PASSWORDS: 'MySecretPass123',   // same as LAVALINK_PASSWORD
    SECURES:   'true'               // always true for Railway
}
```

> ⚠️ **Important:** Do NOT include `https://` in the host. Just the domain name.

---

### Step 6 — Test it

Start your bot and run `+play` with any song. Check the Railway logs — you should see:

```
Lavalink is ready to accept connections.
```

---

## 🔧 Local Testing (optional)

If you want to run Lavalink on your own PC to test:

### Requirements:
- Java 17 or higher → [Download Java 21](https://adoptium.net)

### Steps:
1. Download `Lavalink.jar` from [GitHub Releases](https://github.com/lavalink-devs/Lavalink/releases/latest)
2. Put `Lavalink.jar` and `application.yml` in the same folder
3. Edit `application.yml` — change `${PORT:2333}` to just `2333`
4. Run:
   ```bash
   java -jar Lavalink.jar
   ```
5. Connect your bot with:
   ```js
   HOSTS: 'localhost',
   PORTS: '2333',
   PASSWORDS: 'youshallnotpass',
   SECURES: 'false'
   ```

---

## 📁 File Structure

```
dark-lavalink/
├── application.yml   ← Main Lavalink config (all settings here)
├── Dockerfile        ← Docker build instructions for Railway
├── railway.toml      ← Railway deployment settings
└── README.md         ← This file
```

---

## 🛠️ Configuration Reference

The main config is `application.yml`. Key settings you might want to change:

### Change the password
```yaml
lavalink:
  server:
    password: "your-new-password-here"
```
Or set env var `LAVALINK_PASSWORD` in Railway (recommended — never hardcode passwords).

### Change audio quality
```yaml
lavalink:
  server:
    opusEncodingQuality: 10   # 0–10 (10 = best, more CPU)
    resamplingQuality: HIGH   # LOW / MEDIUM / HIGH
    bufferDurationMs: 400     # Lower = less lag, higher = more stable
```

### Disable SponsorBlock (if you want full YouTube videos)
```yaml
plugins:
  sponsorblock:
    categories: []  # Empty list = disabled
```

---

## 🐛 Troubleshooting

| Problem | Fix |
|---|---|
| Bot shows `ENOTFOUND` | Remove `https://` from your HOSTS config |
| Bot shows `401 Unauthorized` | Password in bot config doesn't match `LAVALINK_PASSWORD` |
| Bot shows `502 Bad Gateway` | Railway is still starting — wait 1–2 minutes |
| `ECONNREFUSED` | Railway service isn't running — check Railway logs |
| Songs won't play from Spotify | Set `SPOTIFY_CLIENT_ID` and `SPOTIFY_CLIENT_SECRET` |
| Railway deploy fails | Check the Dockerfile — make sure the GitHub repo is public |

---

## 📊 Railway Free Tier Limits

Railway's free tier gives you **$5 credit/month**. Lavalink uses roughly:

- **RAM:** ~150–300 MB
- **CPU:** Low when idle, moderate during playback
- **Estimated cost:** ~$2–3/month on Railway's free tier (usually within free limit)

To stay within free limits, set a memory limit in Railway settings: **512 MB max**.

---

## 🔄 Updating Lavalink

When a new Lavalink version releases:

1. Open `Dockerfile`
2. Change: `ENV LAVALINK_VERSION=4.0.8` → new version number
3. Also update plugin versions in `application.yml`
4. Push to GitHub → Railway auto-redeploys

Check latest version: [github.com/lavalink-devs/Lavalink/releases](https://github.com/lavalink-devs/Lavalink/releases)

---

## 📞 Support

- **Discord:** [Join SynthX Dev Server](#) *(add your invite link)*
- **GitHub Issues:** Open an issue on this repo

---

## ❤️ Credits

Built with ❤️ by **Dark** — SynthX Development

If this helped you, consider giving the repo a ⭐ star!

---

*© 2025 Dark (SynthX Development). Credit required for public showcases.*
