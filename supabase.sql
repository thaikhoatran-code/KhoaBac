-- Chạy 1 lần trong Supabase > SQL Editor > New query > Run
create table if not exists public.docs (
  user_id uuid not null default auth.uid() references auth.users(id) on delete cascade,
  name text not null,
  data jsonb not null default '{}'::jsonb,
  updated_at timestamptz not null default now(),
  primary key (user_id, name)
);

alter table public.docs enable row level security;

-- Mỗi người chỉ đọc / ghi được dữ liệu của chính mình
create policy "docs_select_own" on public.docs for select using (auth.uid() = user_id);
create policy "docs_insert_own" on public.docs for insert with check (auth.uid() = user_id);
create policy "docs_update_own" on public.docs for update using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "docs_delete_own" on public.docs for delete using (auth.uid() = user_id);
