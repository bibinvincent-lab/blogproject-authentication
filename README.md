# BlogSpace (first-next-app)

A demo blog and role-based authentication example built with Next.js (App Router), React and Material UI. The project includes secure session handling, device binding, rate limiting, and example CRUD endpoints.

---

## Table of contents

- [Quick start](#quick-start)
- [Environment variables](#environment-variables)
- [Database & migrations](#database--migrations)
- [Available scripts](#available-scripts)
- [All navigable links (UI) and files](#all-navigable-links-ui-and-files)
- [Pages & Functionality (by route)](#pages--functionality-by-route)
- [API endpoints](#api-endpoints)
- [Security & session details](#security--session-details)
- [Project structure (key files)](#project-structure-key-files)
- [Troubleshooting](#troubleshooting)
- [Next steps I can help with](#next-steps-i-can-help-with)

---

## Quick start

Prerequisites

- Node.js 18+ and a package manager (npm/yarn/pnpm)
- MySQL server

Steps

1. Install dependencies

```bash
npm install
```

2. Create `.env.local` (copy from `.env.example`) and set DB credentials

3. Create the database and apply baseline schema + optional migrations

```bash
# create database (example)
mysql -u $DB_USER -p -e "CREATE DATABASE IF NOT EXISTS $DB_NAME CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# apply baseline schema
mysql -u $DB_USER -p $DB_NAME < migrations/000_baseline_schema.sql

# optional: apply security migration provided
mysql -u $DB_USER -p $DB_NAME < migrations/001_enhance_security.sql
```

4. Run development server

```bash
npm run dev
# open http://localhost:3000
```

---

## Environment variables

Copy `.env.example` to `.env.local` and update values.

- File: [/.env.example](.env.example)

Required vars (example):

```
DB_HOST=127.0.0.1
DB_USER=root
DB_PASSWORD=change_me
DB_NAME=blogspace
NODE_ENV=development
```

---

## Database & migrations

- Baseline schema: [migrations/000_baseline_schema.sql](migrations/000_baseline_schema.sql)
- Security migration: [migrations/001_enhance_security.sql](migrations/001_enhance_security.sql)

The app expects at least the `users`, `user_sessions`, and `test` tables. If you start from an empty DB, run the baseline schema first.

---

## Available scripts

- `npm run dev` — start development server
- `npm run build` — production build
- `npm run start` — start production server (after `build`)

---

## All navigable links (UI) and files

Navbar links and other primary routes (clickable in the app):

- Home: `/` — [src/app/page.js](src/app/page.js)
- Blog listing: `/blog` — [src/app/blog/page.js](src/app/blog/page.js)
- Blog detail: `/blog/[slug]` — [src/app/blog/[slug]/page.js](src/app/blog/[slug]/page.js)
- Alternate blog listing: `/blog1` — [src/app/blog1/page.js](src/app/blog1/page.js)
- Add User (placeholder): `/add` — [src/app/add/page.js](src/app/add/page.js)
- Table / Add User: `/tablepage` — [src/app/tablepage/page.js](src/app/tablepage/page.js)
- Test / List Users: `/test` — [src/app/test/page.js](src/app/test/page.js)
- Fetch example: `/fetchexample` — [src/app/fetchexample/page.js](src/app/fetchexample/page.js)
- Contact: `/contact` — [src/app/contact/page.js](src/app/contact/page.js)
- Register: `/register` — [src/app/register/page.js](src/app/register/page.js)
- Login: `/login` — [src/app/(auth)/login/page.js](src/app/(auth)/login/page.js)
- Logout: `/logout` — [src/app/(auth)/logout/page.js](src/app/(auth)/logout/page.js)
- Admin dashboard: `/admin/dashboard` — [src/app/admin/dashboard/page.js](src/app/admin/dashboard/page.js)
- Manager dashboard: `/manager/dashboard` — [src/app/manager/dashboard/page.js](src/app/manager/dashboard/page.js)
- User dashboard: `/user/dashboard` — [src/app/user/dashboard/page.js](src/app/user/dashboard/page.js)

Navbar implementation: [src/app/components/Navbar.js](src/app/components/Navbar.js)

---

## Pages & Functionality (by route)

- `/` — Home ([src/app/page.js](src/app/page.js))
	- Auth-protected home that lists featured posts and links to the blog. Uses `useAuth` to check session.

- `/blog` — Blog listing ([src/app/blog/page.js](src/app/blog/page.js))
	- Protected list of posts (server or client auth in variants). Renders `posts` from [src/lib/posts.js](src/lib/posts.js).

- `/blog/[slug]` — Blog detail ([src/app/blog/[slug]/page.js](src/app/blog/[slug]/page.js))
	- Server-side session validation and device fingerprint validation before rendering the post. Renders `BlogHero` and `BlogContent`.

- `/blog1` — Alternate blog list ([src/app/blog1/page.js](src/app/blog1/page.js))
	- Similar to `/blog` but shows a different UI (server-side session validation).

- `/tablepage` — Add user interface ([src/app/tablepage/page.js](src/app/tablepage/page.js))
	- Form to add users and a table that interacts with the `/api/users` CRUD endpoints. Client-side auth enforced via `useAuth`.

- `/test` — User listing and edit modal ([src/app/test/page.js](src/app/test/page.js))
	- Lists users from `/api/users` and supports pagination + editing via a modal.

- `/fetchexample` — Live fetch example ([src/app/fetchexample/page.js](src/app/fetchexample/page.js))
	- Demonstrates fetching `/api/users` and rendering basic cards.

- `/contact` — Contact form ([src/app/contact/page.js](src/app/contact/page.js))
	- Client-side form (protected via `useAuth`) for demo contact data entry.

- `/register` & `/login` — Auth pages ([src/app/register/page.js](src/app/register/page.js), [src/app/(auth)/login/page.js](src/app/(auth)/login/page.js))
	- Registration posts to `/api/auth/register`. Login posts to `/api/auth/login`, which sets a `sessionToken` cookie on success.

- `/logout` — Logout page ([src/app/(auth)/logout/page.js](src/app/(auth)/logout/page.js))
	- Calls `/api/auth/logout` and redirects to login.

- Role dashboards (`/admin/dashboard`, `/manager/dashboard`, `/user/dashboard`)
	- Each page checks user role on the client (`useAuth`) and redirects if unauthorized.

---

## API endpoints

All API handlers are under: [src/app/api](src/app/api)

- `POST /api/auth/register` — [src/app/api/auth/register/route.js](src/app/api/auth/register/route.js)
	- Body: `{ email, password }` — registers a user (bcrypt password hash).

- `POST /api/auth/login` — [src/app/api/auth/login/route.js](src/app/api/auth/login/route.js)
	- Body: `{ email, password }` — validates credentials, issues or updates session token, and sets `sessionToken` cookie.

- `POST /api/auth/logout` — [src/app/api/auth/logout/route.js](src/app/api/auth/logout/route.js)
	- Body: none — removes session row and clears cookie.

- `GET /api/auth/check` — [src/app/api/auth/check/route.js](src/app/api/auth/check/route.js)
	- Used by client `useAuth` hook to validate session and return `{ authenticated, user }`.

- `GET|POST|PUT|DELETE /api/users` — [src/app/api/users/route.js](src/app/api/users/route.js)
	- CRUD for the `test` table (list, create, update, delete). Requires authentication.

Client auth hook: [src/hooks/useAuth.js](src/hooks/useAuth.js)

---

## Security & session details

- Sessions: generated tokens are created in `src/lib/session.js` and stored in `user_sessions` table. Session expiry and inactivity checks live in `src/lib/session.js`.
- Device fingerprinting: `src/lib/security.js` creates a fingerprint from IP and headers and is used to bind/validate sessions.
- Rate limiting: `src/lib/rateLimit.js` implements an in-memory limiter. For production, replace with Redis.
- Security headers: set in [next.config.mjs](next.config.mjs).
- Middleware: `middleware.js` enforces route-level access and validates session token format.

Key files:

- Session logic: [src/lib/session.js](src/lib/session.js)
- Security helpers: [src/lib/security.js](src/lib/security.js)
- DB connection: [src/lib/db.js](src/lib/db.js)
- Input validation: [src/lib/validation.js](src/lib/validation.js)
- Sanitizer: [src/lib/sanitizer.js](src/lib/sanitizer.js)

---

## Project structure (key files)

- App pages: [src/app](src/app)
- Components: [src/app/components](src/app/components)
- Hooks: [src/hooks/useAuth.js](src/hooks/useAuth.js)
- Server helpers: [src/lib](src/lib)
- API routes: [src/app/api](src/app/api)
- Migrations: [migrations](migrations)

---

## Troubleshooting

- DB connection errors: verify `.env.local` DB settings and that the DB is reachable. Check [src/lib/db.js](src/lib/db.js).
- Missing tables: run `migrations/000_baseline_schema.sql` before running `001_enhance_security.sql`.
- Cookies not appearing: development vs production cookie settings differ (`secure` and `sameSite`). See `/api/auth/login` and `middleware.js`.

---

## Next steps I can help with

- Add a `.github/workflows` CI workflow to run lint/tests.
- Create a seed script to populate `users` and `test` tables with sample data.
- Add a smoke-test script to verify API endpoints (requires running DB).

If you'd like any of the above, tell me which and I'll add them.

