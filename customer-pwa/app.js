import { checkSupabaseConnection } from './supabase-data.js';

const connectionStatus = document.querySelector('#connection-status');
const installButton = document.querySelector('#install-button');
let deferredInstallPrompt;

window.addEventListener('beforeinstallprompt', (event) => {
  event.preventDefault();
  deferredInstallPrompt = event;
  installButton.hidden = false;
});

installButton.addEventListener('click', async () => {
  if (!deferredInstallPrompt) return;
  deferredInstallPrompt.prompt();
  deferredInstallPrompt = null;
  installButton.hidden = true;
});

document.querySelectorAll('.nav-item').forEach((button) => {
  button.addEventListener('click', () => {
    document.querySelectorAll('.nav-item').forEach((item) => item.classList.remove('active'));
    button.classList.add('active');
  });
});

if ('serviceWorker' in navigator) {
  navigator.serviceWorker.register('./sw.js').catch(() => {});
}

const connection = await checkSupabaseConnection();
connectionStatus.textContent = connection.ok
  ? 'اتصال Supabase جاهز للقراءة بعد تجهيز الجداول والصلاحيات.'
  : 'تم تجهيز طبقة Supabase؛ القراءة العامة تحتاج صلاحيات RLS ومفتاحاً صالحاً.';
