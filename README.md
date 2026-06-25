# StreamLink

A real-time video chat application where users can create rooms, hop into calls, and invite others via shareable invite links. Built with **Spring Boot**, **Angular**, **LiveKit**, and **PostgreSQL**.

![Tech Stack](https://img.shields.io/badge/Spring%20Boot-6DB33F?logo=springboot&logoColor=white)
![Angular](https://img.shields.io/badge/Angular-DD0031?logo=angular&logoColor=white)
![LiveKit](https://img.shields.io/badge/LiveKit-0099FF?logo=livekit&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?logo=postgresql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)

---

## ✨ Features

- **Video Rooms** — Create and join video rooms powered by LiveKit.
- **Public & Private Rooms** — Choose whether your room appears in Explore or is accessible only via invite link.
- **Invite Links** — Generate expiring, usage-limited invite links for private rooms (or any room).
- **Host Controls** — Room creators can manage invites, toggle visibility, and close rooms.
- **Explore Tab** — Browse public active rooms and join the conversation.
- **My Rooms** — Keep track of all rooms you created.
- **Secure Authentication** — JWT-based auth with Spring Security.

---

## 🏗️ Tech Stack

| Layer | Technology |
|-------|------------|
| **Backend** | Java 21, Spring Boot 3, Spring Security, Spring Data JPA, Flyway |
| **Frontend** | Angular 21, TypeScript, RxJS, SCSS |
| **Realtime** | LiveKit |
| **Database** | PostgreSQL 16 |
| **DevOps** | Docker, Docker Compose, Kubernetes (kustomize), GitHub Actions |

---

## 🚀 Quick Start

The easiest way to run the full stack locally is with Docker Compose:

```bash
cp .env.example .env
# Edit .env and set LIVEKIT_NODE_IP to your machine's LAN IP if needed

docker compose up -d --build
```

Then open [http://localhost:4200](http://localhost:4200).

### Development Mode

Keep the backend services running and use the Angular dev server:

```bash
docker compose up -d database livekit backend
cd frontend
npm install
npm start
```

The dev server proxies `/api` to the Spring Boot backend on port `8080`.

---

## 📁 Project Structure

```
.
├── backend/          # Spring Boot API
├── frontend/         # Angular application
├── k8s/              # Kubernetes manifests
├── compose.yaml      # Local Docker Compose stack
└── DEVOPS.md         # Deployment & operations guide
```

---

## 🔐 Environment Variables

Copy `.env.example` to `.env` and configure:

| Variable | Purpose |
|----------|---------|
| `LIVEKIT_NODE_IP` | LAN IP for the local LiveKit server to advertise |
| `LIVEKIT_URL` | LiveKit server URL (for LiveKit Cloud) |
| `LIVEKIT_API_KEY` / `LIVEKIT_API_SECRET` | LiveKit credentials |

Database and JWT settings are pre-configured in `compose.yaml` for local development. For Kubernetes, edit `k8s/configmap.yaml` and create `k8s/secret.yaml` with real values.

---

## 🧪 Running Tests

```bash
# Backend
cd backend
./gradlew test

# Frontend
cd frontend
npm run build
```

---

## 🙌 Credits

Built as a project for the Faculty of Computer Science and Engineering, UKIM.
