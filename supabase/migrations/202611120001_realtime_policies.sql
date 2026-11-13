-- Party Arcade: authorize signed-in (including anonymous-auth) sessions for private Realtime channels.
-- Enable Anonymous Sign-ins in Supabase Auth before using the site.
create policy "party_arcade_realtime_receive"
on realtime.messages
for select
to authenticated
using (true);

create policy "party_arcade_realtime_send"
on realtime.messages
for insert
to authenticated
with check (true);
