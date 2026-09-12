-- D12 Break & Run Manager — GitHub Pages / Supabase Realtime Setup
create table if not exists public.d12_event_state (
  event_id text primary key,
  state jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now()
);

alter table public.d12_event_state enable row level security;
grant select, insert, update on table public.d12_event_state to authenticated;
revoke all on table public.d12_event_state from anon;

drop policy if exists "d12 authenticated read" on public.d12_event_state;
drop policy if exists "d12 authenticated insert" on public.d12_event_state;
drop policy if exists "d12 authenticated update" on public.d12_event_state;

create policy "d12 authenticated read"
on public.d12_event_state for select to authenticated using (true);

create policy "d12 authenticated insert"
on public.d12_event_state for insert to authenticated with check (true);

create policy "d12 authenticated update"
on public.d12_event_state for update to authenticated using (true) with check (true);

alter table public.d12_event_state replica identity full;

do $$
begin
  begin
    alter publication supabase_realtime add table public.d12_event_state;
  exception when duplicate_object then
    null;
  end;
end $$;

select schemaname, tablename
from pg_publication_tables
where pubname='supabase_realtime' and tablename='d12_event_state';
