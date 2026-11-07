-- ZoolFast Sudan: initial public catalog schema
-- Run this file in Supabase Dashboard -> SQL Editor.
-- This migration does not require or contain a service_role key.

create extension if not exists pgcrypto;

create table if not exists public.stores (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  type text not null check (type in ('مطعم', 'متجر', 'صيدلية')),
  image_url text,
  rating numeric(2,1) not null default 0 check (rating >= 0 and rating <= 5),
  delivery_time integer not null default 30 check (delivery_time > 0),
  is_open boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.products (
  id uuid primary key default gen_random_uuid(),
  store_id uuid not null references public.stores(id) on delete cascade,
  name text not null,
  price numeric(12,2) not null default 0 check (price >= 0),
  image_url text,
  category text,
  is_available boolean not null default true
);

create table if not exists public.categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  icon text
);

create table if not exists public.orders (
  id uuid primary key default gen_random_uuid(),
  store_id uuid not null references public.stores(id) on delete restrict,
  total numeric(12,2) not null default 0 check (total >= 0),
  status text not null default 'pending',
  created_at timestamptz not null default now()
);

create index if not exists products_store_id_idx on public.products(store_id);
create index if not exists products_available_idx on public.products(is_available);
create index if not exists stores_type_idx on public.stores(type);
create index if not exists stores_open_idx on public.stores(is_open);

alter table public.stores enable row level security;
alter table public.products enable row level security;
alter table public.categories enable row level security;
alter table public.orders enable row level security;

drop policy if exists "Public can read stores" on public.stores;
create policy "Public can read stores"
on public.stores for select
to anon, authenticated
using (true);

drop policy if exists "Public can read products" on public.products;
create policy "Public can read products"
on public.products for select
to anon, authenticated
using (true);

drop policy if exists "Public can read categories" on public.categories;
create policy "Public can read categories"
on public.categories for select
to anon, authenticated
using (true);

-- Keep order records private until customer authentication and order ownership exist.
-- No public SELECT/INSERT/UPDATE/DELETE policy is created for orders in this phase.

insert into public.categories (name, icon)
select * from (values
  ('مطاعم', '🍽️'),
  ('متاجر', '🛒'),
  ('صيدليات', '💊')
) as seed(name, icon)
where not exists (select 1 from public.categories);

insert into public.stores (name, type, image_url, rating, delivery_time, is_open)
select * from (values
  ('مطعم النيلين', 'مطعم', null, 4.7::numeric, 35, true),
  ('سوق بورتسودان', 'متجر', null, 4.4::numeric, 25, true),
  ('صيدلية الشفاء', 'صيدلية', null, 4.8::numeric, 20, true)
) as seed(name, type, image_url, rating, delivery_time, is_open)
where not exists (select 1 from public.stores);

insert into public.products (store_id, name, price, category, is_available)
select s.id, seed.name, seed.price, seed.category, true
from public.stores s
join (values
  ('مطعم النيلين', 'فرخة مشوية', 25000::numeric, 'وجبات'),
  ('مطعم النيلين', 'أرز وسلطة', 8000::numeric, 'إضافات'),
  ('سوق بورتسودان', 'مياه معدنية', 1500::numeric, 'مشروبات'),
  ('سوق بورتسودان', 'سكر 1 كيلو', 3500::numeric, 'أساسيات'),
  ('صيدلية الشفاء', 'فيتامينات عامة', 12000::numeric, 'صحة')
) as seed(store_name, name, price, category) on s.name = seed.store_name
where not exists (select 1 from public.products);
