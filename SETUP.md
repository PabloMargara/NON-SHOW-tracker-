# ⚡ Setup Completo — UXR No-Show Tracker (Supabase + Google Auth)

Tiempo total: ~20 minutos la primera vez.

---

## PARTE 1 — Supabase (10 min)

### 1.1 Crear proyecto en Supabase

1. Ve a [supabase.com](https://supabase.com) → **Start your project**
2. Crea o entra a tu cuenta (puede ser con GitHub)
3. Click **New project**
4. Llena:
   - **Name:** `uxr-noshow-tracker`
   - **Database password:** cualquier password seguro (guárdalo)
   - **Region:** US East (N. Virginia) — suele ser más rápido para LatAm
5. Click **Create new project** → espera ~2 minutos

### 1.2 Crear la tabla (SQL)

1. En tu proyecto de Supabase, ve a **SQL Editor** (menú izquierdo)
2. Click **New query**
3. Copia y pega todo el contenido del archivo `supabase_setup.sql`
4. Click **Run** (o Ctrl/Cmd + Enter)
5. Deberías ver: `Setup completado correctamente ✓`

### 1.3 Obtener las credenciales

1. Ve a **Project Settings** (ícono de engranaje, menú izquierdo)
2. Click **API**
3. Copia estos dos valores:
   - **Project URL** → algo como `https://abcdefghijk.supabase.co`
   - **anon public** key → un JWT largo

---

## PARTE 2 — Google OAuth (10 min)

Necesitas crear credenciales OAuth en Google Cloud para que el login funcione.

### 2.1 Google Cloud Console

1. Ve a [console.cloud.google.com](https://console.cloud.google.com)
2. Crea un proyecto nuevo o usa uno existente
   - Click en el selector de proyecto (arriba) → **New Project**
   - Name: `uxr-noshow-tracker` → **Create**
3. En el menú izquierdo: **APIs & Services → OAuth consent screen**
4. Selecciona **External** → **Create**
5. Llena:
   - **App name:** `UXR No-Show Tracker`
   - **User support email:** tu email
   - **Developer contact:** tu email
6. Click **Save and Continue** en cada paso hasta terminar (no necesitas agregar scopes extras)
7. Click **Back to Dashboard**

### 2.2 Crear credenciales OAuth

1. **APIs & Services → Credentials**
2. Click **+ Create Credentials → OAuth client ID**
3. **Application type:** Web application
4. **Name:** `UXR No-Show Tracker`
5. En **Authorized JavaScript origins** agrega:
   ```
   https://PabloMargara.github.io
   ```
6. En **Authorized redirect URIs** agrega la URL de Supabase:
   ```
   https://TU_PROJECT_ID.supabase.co/auth/v1/callback
   ```
   *(Puedes ver esta URL en Supabase → Authentication → Providers → Google)*
7. Click **Create**
8. Copia:
   - **Client ID** → `xxx.apps.googleusercontent.com`
   - **Client Secret** → string corto

### 2.3 Activar Google en Supabase

1. En Supabase → **Authentication** → **Providers**
2. Encuentra **Google** → click para expandir
3. Toggle **Enable Google provider** → ON
4. Pega el **Client ID** y **Client Secret** del paso anterior
5. **Authorized Client IDs**: pega el mismo Client ID
6. Click **Save**

---

## PARTE 3 — Configurar el código (2 min)

1. Abre `index.html` en tu editor
2. Busca estas líneas (~línea 621):

```javascript
const SUPABASE_URL  = 'YOUR_SUPABASE_URL';
const SUPABASE_ANON = 'YOUR_SUPABASE_ANON';
```

3. Reemplaza con tus valores reales:

```javascript
const SUPABASE_URL  = 'https://abcdefghijk.supabase.co';
const SUPABASE_ANON = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...';
```

---

## PARTE 4 — Subir a GitHub y activar Pages (3 min)

```bash
cd "NON-SHOW - Counter"
git add .
git commit -m "Add Supabase + Google Auth"
git push
```

Si aún no tienes el repo:
```bash
git init
git add .
git commit -m "Initial: UXR No-Show Tracker"
gh repo create NON-SHOW-tracker- --public --source=. --push
```

**Activar GitHub Pages:**
1. Ve al repo en GitHub
2. **Settings → Pages**
3. Source: **Deploy from a branch** → `main` → `/root`
4. Click **Save**
5. Espera ~2 minutos

Tu URL será: **`https://PabloMargara.github.io/NON-SHOW-tracker-/`**

---

## PARTE 5 — Agregar la URL de Pages en Google OAuth (1 min)

Después de que GitHub Pages esté activo:

1. Google Cloud Console → **APIs & Services → Credentials**
2. Click tu OAuth client
3. En **Authorized JavaScript origins** verifica que esté:
   ```
   https://PabloMargara.github.io
   ```
4. Click **Save**

---

## 🎉 Listo

Comparte el link con el equipo: **`https://PabloMargara.github.io/NON-SHOW-tracker-/`**

Cada persona:
1. Abre el link
2. Click **"Entrar con Google"**
3. Selecciona su cuenta de Google
4. Registra no-shows

---

## Troubleshooting

| Problema | Causa | Solución |
|----------|-------|----------|
| Página en blanco después de login | Redirect URI mal configurado | Verifica el Authorized redirect URI en Google Cloud |
| "Error al guardar" | RLS policy | Corre de nuevo el SQL setup |
| "invalid API key" | SUPABASE_ANON incorrecto | Copia de nuevo desde Supabase → Settings → API |
| Login redirige pero no entra | URL en Pages no está en Google OAuth | Agrega la URL en Authorized JavaScript origins |
| Solo algunas personas pueden entrar | Supabase en modo "Restricted" | Authentication → Settings → desactiva "Restrict sign ups" o agrega los emails |

---

## Restricción de emails (opcional)

Si quieres que SOLO las 4 personas del equipo puedan entrar:

1. Supabase → **Authentication → Settings**
2. Busca **"Restrict signups"** y actívalo
3. O simplemente, en el código puedes agregar validación por email (pídeme si lo necesitas)

---

## Credenciales que necesitas tener a mano

| Cosa | Dónde está |
|------|-----------|
| Supabase URL | Supabase → Settings → API → Project URL |
| Supabase Anon Key | Supabase → Settings → API → anon public |
| Google Client ID | Google Cloud → APIs & Services → Credentials |
| Google Client Secret | Google Cloud → APIs & Services → Credentials |
