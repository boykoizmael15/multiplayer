# Party Arcade — GitHub Pages + Supabase

## What this creates
- GitHub Pages publishes the Party Arcade website from `docs/`.
- Supabase Realtime provides room presence, private player messages, and room broadcasts.
- The first player in a room becomes that room's host and runs the existing game engine in their browser.

## Set up Supabase
1. Create a project at https://supabase.com/dashboard.
2. In Authentication → Sign In / Providers, enable **Anonymous Sign-ins**.
3. Confirm Realtime is enabled.
4. Open SQL Editor and run `supabase/migrations/202611120001_realtime_policies.sql`.
5. In Project Settings → API (or the Connect dialog), copy the Project URL and **publishable** key. A legacy anon key is also accepted. Never use a secret or service_role key in the browser.

## Configure the website
1. Copy `docs/supabase-config.js.example` to `docs/supabase-config.js`.
2. Fill `url` and `anonKey` with the Project URL and publishable/anon key.
3. Commit and push `docs/supabase-config.js` to `main`.

The publishable/anon key is intentionally browser-visible. Security is provided by Supabase Auth and RLS, not by hiding this key.

## Enable GitHub Pages
In the GitHub repository, open Settings → Pages and set **Build and deployment → Source** to **GitHub Actions**. The workflow publishes the `docs/` directory on pushes to `main`.

Expected website URL: https://boykoizmael15.github.io/multiplayer/

## Room-host behavior and tradeoffs
The earliest connected player is elected host. Their browser coordinates the room and privately sends each player their own messages. Keep the host's tab open while playing. If the host leaves, another player is elected and the room/game state resets.

This player-host design is suitable for casual friend groups but is not cheat-proof or suitable for ranked/competitive public matches: the host browser holds the room's authoritative state. For stronger trust guarantees, move game logic to a server-side Supabase Edge Function plus durable database state.

GitHub Pages or Supabase may also be blocked by a school's network policy. This setup does not bypass school restrictions; ask school IT to approve the required domains if necessary.
