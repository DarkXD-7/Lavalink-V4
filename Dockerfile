# ─────────────────────────────────────────────────────────────────
#  Dark Lavalink V4 — Dockerfile
#  © 2025 Dark (SynthX Development) — github.com/SynthXDev/dark-lavalink
# ─────────────────────────────────────────────────────────────────

FROM eclipse-temurin:17-jre

WORKDIR /app

ADD https://github.com/lavalink-devs/Lavalink/releases/latest/download/Lavalink.jar Lavalink.jar

COPY application.yml application.yml

EXPOSE 2333

CMD ["java", "-jar", "Lavalink.jar"]
