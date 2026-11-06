const ADMIN_EMAIL = 'aboali.mohamed776@gmail.com';
const DEMO_PASSWORD = 'ZoolFast@123';
const DEMO_OTP = '123456';

const state = {
  section: 'dashboard',
  orderFilter: 'all',
  orderSearch: '',
  captainSearch: '',
  selectedCaptain: null,
  generatedCode: null,
  mapTick: 0,
  orders: [
    {id:'ZF-10482',customer:'محمد أحمد',phone:'091 234 8812',restaurant:'مطعم النيلين',item:'فرخة كاملة مشوية',amount:25000,fee:4000,total:29000,payment:'كاش',captain:'سامي حسن',status:'delivery',time:'منذ 4 د',highlight:true},
    {id:'ZF-10481',customer:'سارة عمر',phone:'099 551 2020',restaurant:'مذاق البحر',item:'سمك بورتسودان + سلطة',amount:18000,fee:4000,total:22000,payment:'بنكك',captain:'طارق علي',status:'pending',time:'منذ 6 د'},
    {id:'ZF-10480',customer:'عبدالله محمد',phone:'090 345 7611',restaurant:'ركن المدينة',item:'برجر دبل + بطاطس',amount:16000,fee:4000,total:20000,payment:'كاش',captain:'ياسر آدم',status:'delivery',time:'منذ 9 د'},
    {id:'ZF-10479',customer:'آمنة الطيب',phone:'011 627 4088',restaurant:'بيت الشاورما',item:'شاورما عربي × 2',amount:14000,fee:4000,total:18000,payment:'بنكك',captain:'محمود النور',status:'delivered',time:'منذ 14 د'},
    {id:'ZF-10478',customer:'عمر دفع الله',phone:'012 470 1193',restaurant:'مطعم النيلين',item:'بروستد عائلي',amount:22000,fee:4000,total:26000,payment:'كاش',captain:'سامي حسن',status:'delivered',time:'منذ 22 د'},
    {id:'ZF-10477',customer:'ريم خالد',phone:'091 750 3601',restaurant:'مذاق البحر',item:'بيتزا خضار كبيرة',amount:19000,fee:4000,total:23000,payment:'كاش',captain:'غير مسند',status:'pending',time:'منذ 26 د'},
    {id:'ZF-10476',customer:'مصعب حسن',phone:'099 119 8420',restaurant:'ركن المدينة',item:'وجبة دجاج مشوي',amount:17000,fee:4000,total:21000,payment:'بنكك',captain:'طارق علي',status:'delivery',time:'منذ 31 د'},
    {id:'ZF-10475',customer:'نجلاء إبراهيم',phone:'090 881 6220',restaurant:'بيت الشاورما',item:'فلافل + عصير',amount:9000,fee:4000,total:13000,payment:'كاش',captain:'ملغي',status:'cancelled',time:'منذ 38 د'}
  ],
  captains: [
    {id:'c1',name:'سامي حسن',phone:'091 245 7812',status:'available',subscription:'ساري حتى 21 نوفمبر',orders:8,earnings:32000,lat:245,lng:520,speed:'34 كم/س',eta:'—'},
    {id:'c2',name:'طارق علي',phone:'099 641 2033',status:'busy',subscription:'ساري حتى 28 نوفمبر',orders:6,earnings:24000,lat:315,lng:620,speed:'28 كم/س',eta:'8 دقائق'},
    {id:'c3',name:'ياسر آدم',phone:'090 761 4290',status:'available',subscription:'ساري حتى 14 نوفمبر',orders:5,earnings:20000,lat:400,lng:420,speed:'31 كم/س',eta:'—'},
    {id:'c4',name:'محمود النور',phone:'011 502 8831',status:'busy',subscription:'ساري حتى 30 نوفمبر',orders:7,earnings:28000,lat:360,lng:725,speed:'22 كم/س',eta:'12 دقيقة'},
    {id:'c5',name:'حسن عوض',phone:'012 903 7712',status:'expired',subscription:'انتهى في 2 نوفمبر',orders:0,earnings:0,lat:470,lng:285,speed:'—',eta:'—'}
  ],
  restaurants: [
    {id:'r1',name:'مطعم النيلين',category:'مشويات وسوداني',rating:'4.8',open:true,orders:32,icon:'♨',menu:[['فرخة كاملة مشوية','25,000 SDG'],['كباب لحم','18,000 SDG'],['سلطة مشكلة','5,000 SDG']]},
    {id:'r2',name:'مذاق البحر',category:'أسماك ومأكولات بحرية',rating:'4.7',open:true,orders:24,icon:'◒',menu:[['سمك بورتسودان','18,000 SDG'],['جمبري مقلي','22,000 SDG'],['سلطة بحرية','9,000 SDG']]},
    {id:'r3',name:'ركن المدينة',category:'وجبات سريعة',rating:'4.5',open:true,orders:19,icon:'◈',menu:[['برجر دبل','12,000 SDG'],['وجبة دجاج مشوي','17,000 SDG'],['بطاطس بالجبنة','7,000 SDG']]},
    {id:'r4',name:'بيت الشاورما',category:'شاورما وفلافل',rating:'4.6',open:true,orders:27,icon:'✦',menu:[['شاورما عربي','7,000 SDG'],['شاورما صاج','8,000 SDG'],['فلافل + عصير','9,000 SDG']]}
  ],
  codes: [
    {code:'ZF-MONTH-4412',captain:'طارق علي',type:'شهري',from:'29 أكتوبر 2026',to:'28 نوفمبر 2026',status:'active'},
    {code:'ZF-WEEK-8821',captain:'سامي حسن',type:'أسبوعي',from:'15 نوفمبر 2026',to:'21 نوفمبر 2026',status:'active'},
    {code:'ZF-MONTH-3908',captain:'محمود النور',type:'شهري',from:'1 نوفمبر 2026',to:'30 نوفمبر 2026',status:'active'},
    {code:'ZF-WEEK-7710',captain:'حسن عوض',type:'أسبوعي',from:'27 أكتوبر 2026',to:'2 نوفمبر 2026',status:'expired'}
  ]
};

const sectionTitles = {dashboard:'الرئيسية',orders:'الطلبات الحية',tracking:'التتبع الحي',captains:'الكباتن',restaurants:'المطاعم والمينيو',codes:'أكواد الاشتراك',settings:'الإعدادات'};
const statusLabels = {pending:'قيد الانتظار',delivery:'قيد التوصيل',delivered:'تم التسليم',cancelled:'ملغي'};
const statusClasses = {pending:'pending',delivery:'delivery',delivered:'delivered',cancelled:'cancelled'};
const captainStatusLabels = {available:'متاح',busy:'مشغول',expired:'اشتراك منتهي'};

const $ = (selector, root=document) => root.querySelector(selector);
const $$ = (selector, root=document) => [...root.querySelectorAll(selector)];

function showToast(message){
  const toast = $('#toast'); toast.textContent = message; toast.classList.add('show');
  clearTimeout(showToast.timer); showToast.timer = setTimeout(()=>toast.classList.remove('show'), 2800);
}
function money(value){ return `${Number(value).toLocaleString('en-US')} SDG`; }
function initials(name){ return name.split(' ').slice(0,2).map(x=>x[0]).join(''); }
function statusBadge(status){ return `<span class="status ${statusClasses[status]}">${statusLabels[status]}</span>`; }
function paymentCell(payment){ return `<span class="pay-method"><i class="dot-pay ${payment === 'بنكك' ? 'bankak' : 'cash'}"></i>${payment}</span>`; }

function enterApp(){
  $('#login-view').classList.add('hidden'); $('#app-shell').classList.remove('hidden');
  renderAll();
}
function handleLogin(event){
  event.preventDefault();
  const email = $('#login-email').value.trim().toLowerCase();
  const password = $('#login-password').value;
  const otp = $('#login-otp').value.trim();
  const error = $('#login-error');
  if(email !== ADMIN_EMAIL || password !== DEMO_PASSWORD || otp !== DEMO_OTP){
    error.textContent = email !== ADMIN_EMAIL ? 'هذا الإيميل غير مصرح له بالدخول.' : 'بيانات الدخول أو كود OTP غير صحيحة.';
    return;
  }
  error.textContent = ''; sessionStorage.setItem('zoolfast_admin_demo','1'); enterApp(); showToast('تم تسجيل دخول الأدمن بنجاح');
}
function logout(){ sessionStorage.removeItem('zoolfast_admin_demo'); $('#app-shell').classList.add('hidden'); $('#login-view').classList.remove('hidden'); $('#login-form').reset(); showToast('تم تسجيل الخروج'); }

function navigate(section){
  state.section = section;
  $$('.nav-item').forEach(item=>item.classList.toggle('active',item.dataset.section===section));
  $$('.section-view').forEach(view=>view.classList.toggle('active',view.id === `section-${section}`));
  $('#page-title').textContent = sectionTitles[section];
  $('#sidebar').classList.remove('open');
  if(section==='dashboard') renderDashboard();
  if(section==='orders') renderOrders();
  if(section==='tracking') renderTracking();
  if(section==='captains') renderCaptains();
  if(section==='restaurants') renderRestaurants();
  if(section==='codes') renderCodes();
}
function bindNavigation(){
  $$('.nav-item').forEach(item=>item.addEventListener('click',()=>navigate(item.dataset.section)));
  $$('[data-go]').forEach(item=>item.addEventListener('click',()=>navigate(item.dataset.go)));
  $('#menu-toggle').addEventListener('click',()=>$('#sidebar').classList.add('open'));
  $('#close-sidebar').addEventListener('click',()=>$('#sidebar').classList.remove('open'));
  $('#logout-btn').addEventListener('click',logout);
  $('#notification-btn').addEventListener('click',()=>showToast('لا توجد تنبيهات جديدة غير المقروءة'));
}

function renderStats(){
  const total = state.orders.reduce((sum,o)=>sum+o.total,0);
  const stats = [
    ['طلبات اليوم',state.orders.length,'+3 مقارنة بالأمس','▣', 'var(--orange-light)','var(--orange)'],
    ['مبيعات اليوم',money(total),'صافي قبل العمولة','◉', '#e7f2ee','var(--green)'],
    ['كباتن متاحين الآن','3','من أصل 5 متصلين','●','#e7f2ee','#1e9360'],
    ['كباتن مشتركين','4','كابتن نشط هذا الشهر','♢','#fff8dd','#987a11']
  ];
  $('#stats-grid').innerHTML = stats.map(s=>`<article class="stat-card" style="--tint:${s[4]};--accent:${s[5]}"><div class="stat-head"><span>${s[0]}</span><span class="stat-icon">${s[3]}</span></div><div class="stat-value">${s[1]}</div><div class="stat-foot"><b>${s[2].split(' ')[0]}</b> ${s[2].split(' ').slice(1).join(' ')}</div></article>`).join('');
}
function renderChart(){
  const values=[42,58,45,72,64,86,98], days=['السبت','الأحد','الإثنين','الثلاثاء','الأربعاء','الخميس','الجمعة'], max=Math.max(...values);
  $('#sales-chart').innerHTML=values.map((value,i)=>`<div class="chart-column"><span class="chart-value">${value}K</span><div class="bar-track"><div class="chart-bar ${i===6?'highlight':''}" style="height:${(value/max)*100}%"></div></div><span class="chart-label">${days[i]}</span></div>`).join('');
}
function orderRow(order, compact=false){
  return `<tr class="${order.highlight?'row-highlight':''}"><td><span class="order-id">${order.id}</span></td><td><div class="customer-cell"><strong>${order.customer}</strong><small dir="ltr">${order.phone}</small></div></td><td>${order.restaurant}</td>${compact?'':`<td>${order.item}</td><td><span class="money">${money(order.total)}</span><small class="muted">${money(order.amount)} + ${money(order.fee)}</small></td><td>${paymentCell(order.payment)}</td>`}<td><div class="captain-cell"><strong>${order.captain}</strong>${order.captain==='غير مسند'?'<small>بانتظار الإسناد</small>':''}</div></td><td>${statusBadge(order.status)}</td><td>${order.time}</td>${compact?'':'<td><button class="action-dots" data-order-action="'+order.id+'">⋮</button></td>'}</tr>`;
}
function renderLatest(){ $('#latest-orders-body').innerHTML=state.orders.slice(0,5).map(o=>orderRow(o,true)).join(''); }
function renderOrders(){
  const query=state.orderSearch.toLowerCase();
  const filtered=state.orders.filter(o=>(state.orderFilter==='all'||o.status===state.orderFilter) && (!query || `${o.id} ${o.customer} ${o.captain} ${o.restaurant}`.toLowerCase().includes(query)));
  $('#orders-body').innerHTML=filtered.map(o=>orderRow(o,false)).join('') || `<tr><td colspan="10"><div class="empty-detail">لا توجد طلبات مطابقة للبحث الحالي.</div></td></tr>`;
  $$('[data-order-action]').forEach(btn=>btn.addEventListener('click',()=>openTransferModal(btn.dataset.orderAction)));
}
function renderDashboard(){renderStats();renderChart();renderLatest();}

function renderMapMarkers(){
  const markers = $('#map-markers');
  const captains = state.captains.map((c,i)=>{
    const driftX = Math.sin((state.mapTick+i)*.6)*7, driftY=Math.cos((state.mapTick+i)*.4)*5;
    const x=c.lng+driftX, y=c.lat+driftY;
    return `<g class="map-marker marker-captain ${c.status==='busy'?'busy':''}" data-map-captain="${c.id}" transform="translate(${x} ${y})"><circle class="pin" r="13"></circle><circle r="4" fill="#fff"></circle><text x="18" y="5">${c.name}</text></g>`;
  }).join('');
  const restaurants=`<g class="map-marker marker-restaurant" transform="translate(540 290)"><circle class="pin" r="11"></circle><text x="16" y="4">مطعم النيلين</text></g><g class="map-marker marker-restaurant" transform="translate(350 220)"><circle class="pin" r="11"></circle><text x="16" y="4">مذاق البحر</text></g><g class="map-marker marker-restaurant" transform="translate(720 250)"><circle class="pin" r="11"></circle><text x="16" y="4">ركن المدينة</text></g><g class="map-marker marker-restaurant" transform="translate(250 360)"><circle class="pin" r="11"></circle><text x="16" y="4">بيت الشاورما</text></g>`;
  const customer=`<g class="map-marker marker-customer" transform="translate(720 410)"><circle class="pin" r="12"></circle><circle r="4" fill="#fff"></circle><text x="17" y="4">الزبون · ZF-10482</text></g>`;
  markers.innerHTML=captains+restaurants+customer;
  $$('[data-map-captain]',markers).forEach(m=>m.addEventListener('click',()=>selectCaptain(m.dataset.mapCaptain)));
}
function renderCaptainMapList(){
  $('#captain-map-list').innerHTML=state.captains.map(c=>`<div class="map-captain-row ${state.selectedCaptain===c.id?'active':''}" data-select-captain="${c.id}"><div class="avatar">${initials(c.name)}</div><div><strong>${c.name}</strong><small>${c.status==='busy'?'طلب قيد التوصيل':'جاهز لاستلام طلب'}</small></div><span class="status-mini ${c.status==='busy'?'orange':'green'}">${captainStatusLabels[c.status]}</span></div>`).join('');
  $$('[data-select-captain]').forEach(row=>row.addEventListener('click',()=>selectCaptain(row.dataset.selectCaptain)));
}
function selectCaptain(id){
  state.selectedCaptain=id; const c=state.captains.find(x=>x.id===id); renderCaptainMapList();
  $('#selected-captain').innerHTML=`<div class="detail-card"><h4>${c.name}</h4><span class="detail-phone">${c.phone}</span><div class="detail-stats"><div><span>الحالة</span><b>${captainStatusLabels[c.status]}</b></div><div><span>السرعة</span><b>${c.speed}</b></div><div><span>الطلب الحالي</span><b>${c.status==='busy'?'ZF-10482':'لا يوجد'}</b></div><div><span>الوقت المتبقي</span><b>${c.eta}</b></div></div><button class="btn" style="background:#fff;color:var(--green);width:100%;margin-top:14px" data-transfer-from-map="${c.id}">تحويل طلب</button></div>`;
  $('[data-transfer-from-map]')?.addEventListener('click',()=>openTransferModal('ZF-10482'));
}
function renderTracking(){renderMapMarkers();renderCaptainMapList(); if(state.selectedCaptain) selectCaptain(state.selectedCaptain);}
function tickMap(){ if(state.section==='tracking'){state.mapTick++;renderMapMarkers();} }

function renderCaptains(){
  const query=state.captainSearch.toLowerCase();
  $('#quick-code-captain').innerHTML=state.captains.filter(c=>c.status!=='expired').map(c=>`<option value="${c.id}">${c.name}</option>`).join('');
  const list=state.captains.filter(c=>c.name.toLowerCase().includes(query)||c.phone.includes(query));
  $('#captains-body').innerHTML=list.map(c=>`<tr><td><div class="captain-cell"><strong>${c.name}</strong><small dir="ltr">${c.phone}</small></div></td><td dir="ltr">${c.phone}</td><td><span class="status ${c.status==='available'?'delivered':c.status==='busy'?'pending':'cancelled'}">${captainStatusLabels[c.status]}</span></td><td class="${c.status==='expired'?'form-error':''}">${c.subscription}</td><td>${c.orders}</td><td><span class="money">${money(c.earnings)}</span></td><td><button class="action-dots" data-captain-action="${c.id}">⋮</button></td></tr>`).join('');
  $$('[data-captain-action]').forEach(btn=>btn.addEventListener('click',()=>openCaptainModal(btn.dataset.captainAction)));
}
function renderRestaurants(){
  $('#restaurant-grid').innerHTML=state.restaurants.map(r=>`<article class="restaurant-card"><div class="restaurant-visual">${r.icon}</div><div class="restaurant-info"><div class="panel-head" style="margin-bottom:0"><div><h3>${r.name}</h3><div class="restaurant-meta"><span>${r.category}</span><b>★ ${r.rating}</b></div></div><span class="status delivered">${r.open?'مفتوح':'مغلق'}</span></div><div class="restaurant-menu"><div class="restaurant-menu-header"><strong>المينيو · ${r.menu.length} أصناف</strong><button class="text-btn" data-menu-add="${r.id}">＋ إضافة</button></div>${r.menu.map(item=>`<div class="menu-item"><span>${item[0]} <small>متوفر</small></span><b>${item[1]}</b></div>`).join('')}</div><div class="menu-actions"><button class="mini-btn" data-restaurant-edit="${r.id}">تعديل المطعم</button><button class="mini-btn" data-menu-view="${r.id}">إدارة المينيو</button></div></div></article>`).join('');
  $$('[data-restaurant-edit]').forEach(btn=>btn.addEventListener('click',()=>openRestaurantModal(btn.dataset.restaurantEdit)));
  $$('[data-menu-add]').forEach(btn=>btn.addEventListener('click',()=>openMenuModal(btn.dataset.menuAdd)));
  $$('[data-menu-view]').forEach(btn=>btn.addEventListener('click',()=>openMenuModal(btn.dataset.menuView)));
}
function renderCodes(){ $('#codes-body').innerHTML=state.codes.map(c=>`<tr><td><span class="order-id">${c.code}</span></td><td>${c.captain}</td><td>${c.type}</td><td>${c.from}</td><td>${c.to}</td><td><span class="status ${c.status==='active'?'delivered':'cancelled'}">${c.status==='active'?'نشط':'منتهي'}</span></td></tr>`).join(''); }

function openModal(content){$('#modal-root').innerHTML=`<div class="modal-backdrop" id="modal-backdrop"><div class="modal">${content}</div></div>`;$('#modal-backdrop').addEventListener('click',e=>{if(e.target.id==='modal-backdrop')closeModal()});$('.modal-close')?.addEventListener('click',closeModal);}
function closeModal(){$('#modal-root').innerHTML='';}
function openTransferModal(orderId){
  const order=state.orders.find(o=>o.id===orderId)||state.orders[0];
  openModal(`<div class="modal-head"><div><p class="eyebrow orange">تحويل الطلب</p><h3>${order.id} · ${order.item}</h3><p class="muted">الكابتن الحالي: <strong>${order.captain}</strong></p></div><button class="icon-btn modal-close">×</button></div><div class="demo-credential" style="margin-top:16px"><span>الطلب</span><strong>${money(order.total)}</strong></div><label style="display:block;color:var(--green);font-weight:800;font-size:12px;margin-top:17px">اختر الكابتن الجديد<select id="transfer-captain" style="width:100%;padding:11px;border:1px solid var(--line);border-radius:9px;margin-top:6px">${state.captains.filter(c=>c.status==='available').map(c=>`<option value="${c.id}">${c.name} · ${c.speed}</option>`).join('')}</select></label><label style="display:block;color:var(--green);font-weight:800;font-size:12px;margin-top:13px">سبب التحويل<textarea id="transfer-reason" rows="3" style="width:100%;padding:11px;border:1px solid var(--line);border-radius:9px;margin-top:6px;resize:vertical" placeholder="مثلاً: الكابتن الحالي بعيد عن موقع المطعم"></textarea></label><div class="modal-actions"><button class="btn primary" id="confirm-transfer">تحويل خلال 3 ثوانٍ</button><button class="btn secondary modal-close">إلغاء</button></div>`);
  $('#confirm-transfer').addEventListener('click',()=>{const captain=state.captains.find(c=>c.id===$('#transfer-captain').value);const button=$('#confirm-transfer');button.disabled=true;button.textContent='جارٍ التحويل...';setTimeout(()=>{order.captain=captain.name;order.status='delivery';order.highlight=true;closeModal();renderOrders();renderDashboard();showToast(`تم تحويل ${order.id} إلى ${captain.name} وإرسال إشعار للزبون`);},3000)});
}
function openCaptainModal(id){
  const captain=state.captains.find(c=>c.id===id);
  openModal(`<div class="modal-head"><div><p class="eyebrow orange">إدارة الكابتن</p><h3>${captain?captain.name:'إضافة كابتن جديد'}</h3><p class="muted">بيانات التشغيل والصور التجريبية</p></div><button class="icon-btn modal-close">×</button></div><div class="modal-grid"><label>الاسم الكامل<input id="captain-name" value="${captain?.name||''}" placeholder="اسم الكابتن" /></label><label>رقم التلفون<input id="captain-phone" dir="ltr" value="${captain?.phone||''}" placeholder="09x xxx xxxx" /></label><label>رقم الموتر<input placeholder="مثال: موتر 204" /></label><label>الحالة<select><option>متاح</option><option>مشغول</option><option>غير متاح</option></select></label></div><label style="display:block;color:var(--green);font-size:11px;font-weight:800;margin-top:13px">صورة الكابتن<input type="file" accept="image/*" /></label><label style="display:block;color:var(--green);font-size:11px;font-weight:800;margin-top:13px">صورة الرخصة<input type="file" accept="image/*" /></label><div class="modal-actions"><button class="btn primary" id="save-captain">حفظ البيانات</button><button class="btn secondary modal-close">إلغاء</button></div>`);
  $('#save-captain').addEventListener('click',()=>{const name=$('#captain-name').value.trim()||'كابتن جديد'; if(!captain){state.captains.push({id:`c${Date.now()}`,name,phone:$('#captain-phone').value.trim()||'09x xxx xxxx',status:'available',subscription:'بانتظار الاشتراك',orders:0,earnings:0,lat:280,lng:400,speed:'—',eta:'—'});}else{captain.name=name;captain.phone=$('#captain-phone').value.trim()||captain.phone;}closeModal();renderCaptains();renderTracking();showToast('تم حفظ بيانات الكابتن تجريبياً')});
}
function openRestaurantModal(id){
  const restaurant=state.restaurants.find(r=>r.id===id);
  openModal(`<div class="modal-head"><div><p class="eyebrow orange">المطاعم</p><h3>${restaurant?restaurant.name:'إضافة مطعم جديد'}</h3><p class="muted">داخل بورتسودان فقط</p></div><button class="icon-btn modal-close">×</button></div><div class="modal-grid"><label>اسم المطعم<input id="restaurant-name" value="${restaurant?.name||''}" placeholder="اسم المطعم" /></label><label>رقم التلفون<input value="+249" dir="ltr" /></label><label>التصنيف<input value="${restaurant?.category||'مطاعم ومأكولات'}" /></label><label>أوقات العمل<input value="10:00 ص - 11:00 م" /></label></div><label style="display:block;color:var(--green);font-size:11px;font-weight:800;margin-top:13px">صورة المطعم<input type="file" accept="image/*" /></label><div class="modal-actions"><button class="btn primary" id="save-restaurant">حفظ المطعم</button><button class="btn secondary modal-close">إلغاء</button></div>`);
  $('#save-restaurant').addEventListener('click',()=>{const name=$('#restaurant-name').value.trim()||'مطعم جديد في بورتسودان';if(!restaurant)state.restaurants.push({id:`r${Date.now()}`,name,category:'مطاعم ومأكولات',rating:'جديد',open:true,orders:0,icon:'♨',menu:[]});else restaurant.name=name;closeModal();renderRestaurants();showToast('تم حفظ المطعم تجريبياً')});
}
function openMenuModal(id){
  const restaurant=state.restaurants.find(r=>r.id===id);
  openModal(`<div class="modal-head"><div><p class="eyebrow orange">المينيو</p><h3>${restaurant.name}</h3><p class="muted">إضافة وجبة أو تعديل تفاصيلها</p></div><button class="icon-btn modal-close">×</button></div><label style="display:block;color:var(--green);font-size:11px;font-weight:800;margin-top:13px">اسم الوجبة<input id="dish-name" placeholder="مثال: فرخة كاملة مشوية" /></label><div class="modal-grid"><label>السعر<input id="dish-price" type="number" placeholder="25000" /></label><label>الوصف<input id="dish-description" placeholder="وصف مختصر" /></label></div><label style="display:block;color:var(--green);font-size:11px;font-weight:800;margin-top:13px">صورة الوجبة<input type="file" accept="image/*" /></label><div class="modal-actions"><button class="btn primary" id="save-dish">إضافة إلى المينيو</button><button class="btn secondary modal-close">إلغاء</button></div>`);
  $('#save-dish').addEventListener('click',()=>{const name=$('#dish-name').value.trim()||'وجبة جديدة';const price=Number($('#dish-price').value||0).toLocaleString('en-US')+' SDG';restaurant.menu.push([name,price]);closeModal();renderRestaurants();showToast(`تمت إضافة ${name} إلى مينيو ${restaurant.name}`)});
}
function generateCode(){
  const type=$('#quick-code-type').value, captainId=$('#quick-code-captain').value, captain=state.captains.find(c=>c.id===captainId);const prefix=type==='week'?'ZF-WEEK':'ZF-MONTH';const number=Math.floor(1000+Math.random()*8999);const code=`${prefix}-${number}`;state.generatedCode=code;$('#quick-code-value').textContent=code;$('#quick-generated').classList.remove('hidden');state.codes.unshift({code,captain:captain.name,type:type==='week'?'أسبوعي':'شهري',from:'6 نوفمبر 2026',to:type==='week'?'12 نوفمبر 2026':'5 ديسمبر 2026',status:'active'});renderCodes();showToast(`تم توليد الكود ${code}`);
}
function copyCode(){if(!state.generatedCode)return;navigator.clipboard?.writeText(state.generatedCode);showToast(`تم نسخ ${state.generatedCode}`)}
function whatsappCode(){if(!state.generatedCode)return;window.open(`https://wa.me/249124058142?text=${encodeURIComponent('كود اشتراك ZoolFast: '+state.generatedCode)}`,'_blank');}
function bindDynamic(){
  $('#order-search').addEventListener('input',e=>{state.orderSearch=e.target.value;renderOrders()});
  $('#captain-search').addEventListener('input',e=>{state.captainSearch=e.target.value;renderCaptains()});
  $$('#order-filters .filter-tab').forEach(tab=>tab.addEventListener('click',()=>{$$('#order-filters .filter-tab').forEach(t=>t.classList.remove('active'));tab.classList.add('active');state.orderFilter=tab.dataset.filter;renderOrders()}));
  $('#quick-generate').addEventListener('click',generateCode);$('#copy-quick-code').addEventListener('click',copyCode);$('#whatsapp-quick').addEventListener('click',whatsappCode);
  $('#add-captain-btn').addEventListener('click',()=>openCaptainModal());$('#add-restaurant-btn').addEventListener('click',()=>openRestaurantModal());$('#new-order-btn').addEventListener('click',()=>{const id=`ZF-${10483+state.orders.length}`;state.orders.unshift({id,customer:'زبون تجريبي',phone:'091 000 0000',restaurant:'مطعم النيلين',item:'فرخة كاملة مشوية',amount:25000,fee:4000,total:29000,payment:'كاش',captain:'غير مسند',status:'pending',time:'الآن',highlight:true});renderOrders();renderDashboard();showToast(`وصل طلب جديد ${id}`)});
  $('#fullscreen-map').addEventListener('click',()=>{$('#map-canvas').requestFullscreen?.()});$('#save-settings').addEventListener('click',()=>showToast('تم حفظ إعدادات التشغيل تجريبياً'));
  $$('.toggle').forEach(toggle=>toggle.addEventListener('click',()=>toggle.classList.toggle('on')));
}
function renderAll(){bindNavigation();bindDynamic();navigate(state.section);}

$('#login-form').addEventListener('submit',handleLogin);
if(sessionStorage.getItem('zoolfast_admin_demo')==='1') enterApp();
setInterval(tickMap,5000);
