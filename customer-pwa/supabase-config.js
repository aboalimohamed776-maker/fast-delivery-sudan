// Publishable/anon keys are safe for browser clients when Supabase RLS is configured.
// Never place a service_role key in this file.
export const SUPABASE_CONFIG = Object.freeze({
  url: 'https://aexmcwkhmcfnuezbbgun.supabase.co',
  publishableKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFleG1jd2tobWNmbnVlemJiZ3VuIiwicm9sZSI6ImFub24iLCJpYXQiOjE3OTQwMTE2OTIsImV4cCI6MjEwOTU4NzY5Mn0.oVBBjVw3pPVFuJXVA2bwdU3ZEfohxh10BVUcNVjUpao',
  schema: 'public',
});
