-- Party Arcade private Realtime room channels.
-- Anonymous users sign in and receive the authenticated Postgres role.
create policy "party_arcade_realtime_read"
on realtime.messages
for select
to authenticated
using (
  realtime.messages.extension in ('broadcast', 'presence')
  and (
    realtime.topic() like 'party-room:%'
    or realtime.topic() like 'party-player:%'
  )
);

create policy "party_arcade_realtime_write"
on realtime.messages
for insert
to authenticated
with check (
  realtime.messages.extension in ('broadcast', 'presence')
  and (
    realtime.topic() like 'party-room:%'
    or realtime.topic() like 'party-player:%'
  )
);
