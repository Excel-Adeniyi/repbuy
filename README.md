# REPBUY

A fintech platform for paying bills and buying digital products. Users can fund a wallet and purchase airtime, data bundles, electricity tokens, and gift cards, with real-time transaction updates.

The repository holds both halves of the product on separate branches:

| Branch | What it contains |
|---|---|
| [`main`](../../tree/main) | Cross-platform **Flutter mobile app** (package name: `shapmanpaypoint`) |
| [`backend`](../../tree/backend) | **Node.js/TypeScript (Express) API** that powers the app, integrating with [Reloadly](https://www.reloadly.com/) for service provision and Paystack for payments |

---

## Frontend — Flutter App (`main` branch)

### Features

- **Onboarding & Auth** — email/password sign-up and sign-in, Google Sign-In, OTP verification, forgot-password flow, transaction PIN setup, and biometric unlock (fingerprint/Face ID via `local_auth`). Idle-timeout and auth middleware protect the dashboard routes.
- **Wallet & Funding** — fund your wallet via Paystack card payment or bank transfer, with a payment summary and review step.
- **Airtime & Recharge** — top up airtime for supported network operators.
- **Data Bundles** — browse and buy operator data plans.
- **Electricity Bills** — pay utility bills and receive tokens.
- **Gift Cards** — browse, review, and purchase gift cards.
- **Transactions** — transaction history list and single-purchase detail views, with real-time updates over WebSockets and push notifications (Firebase Cloud Messaging + local notifications).
- **Profile** — avatar selection and profile management.

### Tech Stack

| Area | Choice |
|---|---|
| Framework | Flutter (Dart SDK ≥ 3.0.5) |
| State management & routing | [GetX](https://pub.dev/packages/get) (controllers, bindings, middlewares, named routes) |
| Networking | Dio (REST) + `web_socket_channel` (real-time) |
| Models / codegen | Freezed + `json_serializable` |
| Secrets / config | Envied (generated from `.env` files) |
| Storage | `get_storage` (local) + `flutter_secure_storage` (sensitive data) |
| Payments | Paystack (via a [forked `flutter_paystack`](https://github.com/I-driod/flutter_paystack)) |
| Auth services | Firebase Auth, Google Sign-In, JWT (`dart_jsonwebtoken`) |
| Notifications | Firebase Messaging + `flutter_local_notifications` |

### Project Structure

```
lib/
├── main.dart                # App entry point
├── routes/routes.dart       # All GetX named routes
├── Screens/                 # UI screens (login, signup, dashboard, funding,
│                            #   serviceScreen, walletscreen, profile, onboarding)
├── controller/              # GetX controllers (airtime, data, electric, giftcard,
│                            #   auth, payments, transactions, ...)
├── services/                # API/service layer (login, OTP, operators, payments,
│                            #   gift cards, real-time connection, tokens)
├── Model/                   # Freezed data models
├── Binding/                 # GetX dependency bindings
├── Middleware/              # Auth + idle-timeout route middleware
├── widgets/                 # Shared widgets (layout, OTP screens, payment review)
├── utils/                   # Colors, responsiveness, dialogs, JSON assets, helpers
└── assets/                  # Images, env files, generated Envied config
```

### Getting Started

#### Prerequisites

- Flutter SDK (Dart ≥ 3.0.5) — verify with `flutter doctor`
- A device or emulator (Android/iOS; desktop and web targets are scaffolded)
- Firebase project configured for the app (google-services files / FlutterFire)

#### 1. Install dependencies

```bash
flutter pub get
```

#### 2. Configure environment variables

The app reads secrets at build time via [Envied](https://pub.dev/packages/envied) from `lib/assets/env/.env.dev` (and `.env.prod`). Create the file with:

```env
secret_key=...      # Paystack secret key
public_key=...      # Paystack public key
baseurl_dev=...     # Backend API base URL
csp_key=...
jws_key=...         # JWT signing key
```

#### 3. Run code generation

Freezed models and the Envied config are generated:

```bash
dart run build_runner build --delete-conflicting-outputs
```

#### 4. Run the app

```bash
flutter run
```

### Useful Commands

```bash
flutter test                                          # Run tests
flutter analyze                                       # Static analysis (flutter_lints)
dart run flutter_native_splash:create                 # Regenerate splash screen
flutter build apk --release                           # Android release build
flutter build ipa --release                           # iOS release build
```

---

## Backend — Node.js API (`backend` branch)

An Express + TypeScript API that the Flutter app talks to. It proxies purchases to the **Reloadly** API (airtime, data, gift cards, utility bills), verifies **Paystack** payments (including a funding webhook and dedicated virtual accounts), and pushes real-time updates to the app.

### Highlights

- **Auth** — signup/login (including Google Sign-In), OTP via email (Nodemailer), transaction-PIN verification, JWT (`verifyToken` middleware), CSRF protection, sessions, and Helmet hardening.
- **Services** — endpoints for airtime, data bundles, operators, gift cards (browse by country, order, pay), utility/electricity billers (verify + purchase), wallet balance, and transaction history.
- **Real-time & notifications** — WebSocket server (`ws`) for live transaction/utility updates and Firebase Admin for FCM push notifications.
- **Storage** — MySQL (via `mysql2`) for application data, SQLite for sessions, and `node-cache` for caching.
- **Deployment** — Dockerized: `docker-compose.yml` runs the Node app, MySQL 8, and an Nginx reverse proxy (app listens on port `2110`).

### Backend structure

```
src/
├── index.ts                 # Server entry point
├── controller/
│   ├── http/                # REST controllers (Auth, Airtime, Data, GiftCards,
│   │                        #   Utility, Payments, Wallet, Transactions, OTP, FCM)
│   └── ws/                  # WebSocket controllers
├── Services/                # Paystack funding webhook, Firebase Admin
├── middleware/              # JWT verification, CSRF, sessions, caching
├── model/                   # DB models
├── config/                  # MySQL connection config
└── helper/                  # Axios instance (Reloadly), reference generators
```

### Running the backend

```bash
git checkout backend
npm install
# create a .env with your MySQL, JWT, Paystack, Reloadly, and mail credentials
npm start                    # runs nodemon src/index.ts

# or with Docker (app + MySQL + Nginx):
docker compose up --build
```

---

## License

See [LICENSE](LICENSE).
