import { SUPABASE_CONFIG } from './supabase-config.js';

export async function readTable(table, query = '') {
  const endpoint = `${SUPABASE_CONFIG.url}/rest/v1/${encodeURIComponent(table)}${query}`;
  const response = await fetch(endpoint, {
    headers: {
      apikey: SUPABASE_CONFIG.publishableKey,
      Authorization: `Bearer ${SUPABASE_CONFIG.publishableKey}`,
      Accept: 'application/json',
    },
  });
  if (!response.ok) throw new Error(`Supabase request failed (${response.status})`);
  return response.json();
}

export async function checkSupabaseConnection() {
  try {
    await readTable('restaurants', '?select=id&limit=1');
    return { ok: true };
  } catch (error) {
    return { ok: false, error };
  }
}
