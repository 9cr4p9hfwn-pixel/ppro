cat > /mnt/user-data/outputs/ParcelPro.html << 'HTMLEOF'
<!DOCTYPE html>
<html lang="th">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ParcelPro — ระบบจัดการร้านพัสดุ</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Sarabun:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
<style>
*{box-sizing:border-box;margin:0;padding:0}
:root{
  --bg:#0f1117;--sidebar:#13151f;--card:#1a1d2e;--card2:#131520;
  --border:#252840;--border2:#1e2130;
  --text:#e8e9f0;--text2:#c4c9e8;--muted:#9ca3b0;--faint:#6b7280;
  --purple:#6c63ff;--purple2:#a855f7;--purple-dim:#2d2860;
  --green:#34d399;--green-bg:#0d2e1a;
  --red:#f87171;--red-bg:#2e0d14;
  --yellow:#fbbf24;--yellow-bg:#2e230d;
  --blue:#60a5fa;--blue-bg:#0d1b2e;
}
body{font-family:'Sarabun',sans-serif;background:var(--bg);color:var(--text);min-height:100vh;display:flex;overflow:hidden}
::-webkit-scrollbar{width:4px}::-webkit-scrollbar-track{background:var(--sidebar)}::-webkit-scrollbar-thumb{background:#3b4068;border-radius:4px}
button{cursor:pointer;border:none;font-family:inherit;font-size:14px;font-weight:500;transition:all .2s;border-radius:10px}
input,select,textarea{outline:none;font-family:inherit}
.btn-primary{background:linear-gradient(135deg,var(--purple),var(--purple2));color:#fff;padding:10px 20px}
.btn-primary:hover{opacity:.85;transform:translateY(-1px);box-shadow:0 4px 20px #6c63ff55}
.btn-ghost{background:var(--card2);color:var(--muted);padding:8px 16px;border:1px solid var(--border)}
.btn-ghost:hover{background:var(--card);color:var(--text)}
.btn-danger{background:var(--red-bg);color:var(--red);padding:8px 16px;border:1px solid #f8717133}
.card{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:20px}
.inp{background:var(--card2);border:1px solid var(--border);border-radius:10px;color:var(--text);padding:10px 14px;font-family:inherit;font-size:14px;width:100%}
.inp:focus{border-color:var(--purple);box-shadow:0 0 0 3px #6c63ff22}
.lbl{font-size:11px;color:var(--faint);margin-bottom:5px;display:block;font-weight:600;text-transform:uppercase;letter-spacing:.5px}
.badge{display:inline-flex;align-items:center;gap:4px;padding:2px 10px;border-radius:20px;font-size:11px;font-weight:700}
.b-green{background:var(--green-bg);color:var(--green)}
.b-red{background:var(--red-bg);color:var(--red)}
.b-yellow{background:var(--yellow-bg);color:var(--yellow)}
.b-blue{background:var(--blue-bg);color:var(--blue)}
.b-purple{background:var(--purple-dim);color:#a78bfa}
.tag{background:var(--card);border:1px solid var(--border);border-radius:20px;padding:5px 14px;font-size:12px;color:var(--muted);cursor:pointer;transition:all .2s}
.tag.on{background:var(--purple-dim);border-color:var(--purple);color:#a78bfa}
/* SIDEBAR */
#sidebar{width:220px;background:var(--sidebar);border-right:1px solid var(--border2);padding:20px 14px;display:flex;flex-direction:column;gap:3px;flex-shrink:0;height:100vh;overflow-y:auto}
.logo-wrap{display:flex;align-items:center;gap:10px;margin-bottom:24px}
.logo-icon{background:linear-gradient(135deg,var(--purple),var(--purple2));border-radius:10px;padding:9px;display:flex}
.nav-item{display:flex;align-items:center;gap:10px;padding:10px 13px;border-radius:10px;cursor:pointer;color:var(--faint);font-size:14px;font-weight:500;transition:all .2s;user-select:none}
.nav-item:hover{background:var(--border2);color:var(--text2)}
.nav-item.active{background:linear-gradient(135deg,#2d2860,#3d1f6b);color:#a78bfa}
.sidebar-bottom{margin-top:auto;display:flex;flex-direction:column;gap:8px}
.profit-card{padding:14px;background:var(--card);border-radius:12px;border:1px solid var(--border)}
.save-btn{display:flex;align-items:center;justify-content:center;gap:7px;padding:9px;border-radius:10px;font-size:13px;font-weight:600;cursor:pointer;transition:all .2s;border:1px solid}
.save-btn.export{background:#1e1a40;color:#a78bfa;border-color:#3b2f70}
.save-btn.export:hover{background:#2d2860}
.save-btn.import{background:var(--card2);color:var(--muted);border-color:var(--border)}
.save-btn.import:hover{background:var(--card);color:var(--text2)}
/* MAIN */
#main{flex:1;overflow-y:auto;padding:28px 32px;height:100vh}
.page-title{font-size:20px;font-weight:800;color:var(--text);margin-bottom:3px}
.page-sub{font-size:13px;color:var(--faint);margin-bottom:22px}
.page-header{display:flex;justify-content:space-between;align-items:flex-start;flex-wrap:wrap;gap:12px;margin-bottom:22px}
/* STATS GRID */
.stats-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(190px,1fr));gap:14px;margin-bottom:22px}
.stat-card{background:linear-gradient(135deg,var(--card),#1e2340);border:1px solid var(--border);border-radius:16px;padding:20px;position:relative;overflow:hidden}
.stat-icon{padding:9px;border-radius:10px;display:inline-flex}
/* TABLE */
.tbl-wrap{background:var(--card);border:1px solid var(--border);border-radius:16px;overflow:hidden}
.tbl-head{display:grid;background:var(--card2);padding:11px 16px;font-size:11px;font-weight:700;color:var(--faint);text-transform:uppercase;letter-spacing:.5px;border-bottom:1px solid var(--border2)}
.tbl-row{display:grid;padding:11px 16px;border-bottom:1px solid var(--border2);font-size:13px;align-items:center;transition:background .15s}
.tbl-row:hover{background:var(--border2)}
.tbl-row:last-child{border-bottom:none}
/* PROGRESS */
.prog{background:var(--border2);border-radius:20px;height:5px;overflow:hidden;margin-top:8px}
.prog-fill{height:100%;border-radius:20px;background:linear-gradient(90deg,var(--purple),var(--purple2));transition:width .5s}
/* MODAL */
.overlay{position:fixed;inset:0;background:#00000090;backdrop-filter:blur(5px);display:flex;align-items:center;justify-content:center;z-index:1000}
.modal{background:var(--card);border:1px solid var(--border);border-radius:20px;padding:26px;width:480px;max-width:95vw;max-height:90vh;overflow-y:auto}
.modal-title{font-size:17px;font-weight:800;margin-bottom:22px;display:flex;justify-content:space-between;align-items:center}
.form-row{margin-bottom:14px}
.form-grid2{display:grid;grid-template-columns:1fr 1fr;gap:12px;margin-bottom:14px}
.form-grid3{display:grid;grid-template-columns:1fr 1fr 1fr;gap:10px;margin-bottom:14px}
/* PACKING */
.pack-size{flex:1;min-width:80px;padding:14px 8px;border-radius:12px;text-align:center;cursor:pointer;border:2px solid var(--border);background:var(--card2);transition:all .2s}
.pack-size.on{border-color:var(--purple);background:var(--purple-dim)}
.addon-row{display:flex;align-items:center;justify-content:space-between;padding:11px 14px;border-radius:10px;cursor:pointer;border:1px solid var(--border);background:var(--card2);margin-bottom:8px;transition:all .2s}
.addon-row.on{border-color:var(--purple);background:#1e1a40}
.checkbox{width:19px;height:19px;border-radius:5px;border:2px solid var(--border);display:flex;align-items:center;justify-content:center;transition:all .2s;flex-shrink:0}
.checkbox.on{background:var(--purple);border-color:var(--purple)}
/* STOCK CARD */
.stock-grid{display:grid;grid-template-columns:repeat(auto-fill,minmax(260px,1fr));gap:14px}
.stock-card{background:var(--card);border:1px solid var(--border);border-radius:16px;padding:18px;position:relative}
.qty-ctrl{display:flex;align-items:center;gap:10px}
.qty-btn{width:30px;height:30px;border-radius:8px;background:var(--card2);border:1px solid var(--border);color:var(--text);font-size:18px;display:flex;align-items:center;justify-content:center;cursor:pointer;transition:all .2s}
.qty-btn:hover{background:var(--border2);border-color:var(--purple)}
/* TOAST */
#toast{position:fixed;bottom:28px;left:50%;transform:translateX(-50%);padding:12px 26px;border-radius:12px;font-size:14px;font-weight:700;z-index:9999;opacity:0;transition:opacity .3s;pointer-events:none;white-space:nowrap}
#toast.show{opacity:1}
#toast.success{background:var(--green-bg);color:var(--green);border:1px solid #34d39944}
#toast.error{background:var(--red-bg);color:var(--red);border:1px solid #f8717144}
/* CONFIRM */
.confirm-box{background:var(--card);border:1px solid var(--border);border-radius:20px;padding:28px;width:380px;max-width:95vw;text-align:center}
/* MISC */
.two-col{display:grid;grid-template-columns:1fr 1fr;gap:16px;margin-bottom:22px}
.row-flex{display:flex;gap:10px;flex-wrap:wrap;align-items:center}
.section-label{font-size:14px;font-weight:700;color:var(--text2);margin-bottom:14px}
.empty{text-align:center;padding:48px;color:var(--faint);font-size:14px}
svg{display:inline-block;vertical-align:middle}
@media(max-width:700px){#sidebar{width:180px}#main{padding:18px 16px}.two-col{grid-template-columns:1fr}.form-grid2{grid-template-columns:1fr}}
</style>
</head>
<body>

<!-- SIDEBAR -->
<div id="sidebar">
  <div class="logo-wrap">
    <div class="logo-icon">
      <svg width="20" height="20" viewBox="0 0 24 24" fill="white"><path d="M20 8h-2.81c-.45-.78-1.07-1.45-1.82-1.96L17 4.41 15.59 3l-2.17 2.17C13 5.06 12.51 5 12 5s-1 .06-1.41.17L8.41 3 7 4.41l1.62 1.63C7.88 6.55 7.26 7.22 6.81 8H4v2h2.09C6.04 10.33 6 10.66 6 11v1H4v2h2v1c0 .34.04.67.09 1H4v2h2.81c1.04 1.79 2.97 3 5.19 3s4.15-1.21 5.19-3H20v-2h-2.09c.05-.33.09-.66.09-1v-1h2v-2h-2v-1c0-.34-.04-.67-.09-1H20V8zm-6 8h-4v-2h4v2zm0-4h-4v-2h4v2z"/></svg>
    </div>
    <div>
      <div style="font-size:15px;font-weight:800;color:var(--text)">ParcelPro</div>
      <div style="font-size:10px;color:var(--faint)">ระบบจัดการร้านพัสดุ</div>
    </div>
  </div>

  <div class="nav-item active" onclick="goto('dashboard')" id="nav-dashboard">
    <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor"><path d="M3 13h8V3H3v10zm0 8h8v-6H3v6zm10 0h8V11h-8v10zm0-18v6h8V3h-8z"/></svg>
    ภาพรวม
  </div>
  <div class="nav-item" onclick="goto('transactions')" id="nav-transactions">
    <svg width="17" height="17" viewBox="0 0 24 24" fill="currentColor"><path d="M19 3H5c-1.1 0-2 .9-2 2v14c0 1.1.9