# 📊 UXR No-Show Tracker 2026 (Online)

Track no-shows across the UXR team with a shared online dashboard. At the end of the year, the person with the most no-shows "wins."

**Team:** Anna, Aleja, Hector, Pablo

---

## 🚀 Setup (one time - solo Pablo)

### 1. Customizar el código

Edita `index.html` y busca estas líneas (cerca de la línea 621):

```javascript
const GITHUB_OWNER = 'YOUR_USERNAME'; // Cambiar a tu usuario de GitHub
const GITHUB_REPO = 'NON-SHOW-tracker-'; // Si el repo tiene otro nombre
```

Ejemplo:
```javascript
const GITHUB_OWNER = 'PabloMargara';
const GITHUB_REPO = 'NON-SHOW-tracker-';
```

### 2. Crear el repo en GitHub

```bash
cd "NON-SHOW - Counter"
git init
git add .
git commit -m "Initial: UXR No-Show Tracker 2026"
gh repo create NON-SHOW-tracker- --public --source=. --push
```

**Nota:** Debe ser **público** para que GitHub Pages funcione en la versión gratuita.

### 3. Habilitar GitHub Pages

1. Ve a tu repo en GitHub
2. Settings → Pages
3. Source: selecciona **main** branch
4. Root directory: **/root** (o root si aparece)
5. Click "Save"

Espera 1-2 minutos. Tu app estará en: **`https://YOUR_USERNAME.github.io/NON-SHOW-tracker-/`**

---

## 🔐 Cómo generar Personal Access Token (todos)

Cada miembro del equipo necesita su propio token para poder guardar datos.

### Pasos:

1. Ve a GitHub → Settings → Developer settings → **Personal access tokens (classic)**
   - Link directo: https://github.com/settings/tokens

2. Click **"Generate new token (classic)"**

3. Dale un nombre: `NON-SHOW-tracker`

4. Selecciona solo este scope:
   - ☑️ `repo` (acceso a repositorios privados y públicos)

5. Click **"Generate token"** al final

6. **COPIA EL TOKEN** (solo aparece una vez)

7. En la app, click **"Agregar Token"** y pégalo

**Importante:** 
- ⚠️ No compartas el token
- ⚠️ Se guarda solo en tu navegador (localStorage)
- ⚠️ Si pierdes el token, genera uno nuevo en GitHub

---

## 📱 Uso diario

1. Abre la app: **`https://YOUR_USERNAME.github.io/NON-SHOW-tracker-/`**
2. Click **"Agregar Token"** y pega tu personal access token
3. Selecciona el miembro del equipo
4. Selecciona la fecha
5. Click **"Registrar"**

¡Eso es! Los datos se guardan automáticamente en el repo de GitHub.

---

## 📊 Que ves en el dashboard

- **Stats cards:** Ranking en tiempo real
- **Gráfica de barras:** No-shows por mes
- **Tabla mensual:** Desglose por miembro y mes
- **Entradas recientes:** Historial con opción de eliminar

---

## 🛠️ Troubleshooting

| Problema | Solución |
|----------|----------|
| "Error al cargar" | Verifica que hayas editado `GITHUB_OWNER` correctamente |
| "Token inválido" | Regenera el token en GitHub (Settings → Personal tokens) |
| Página en blanco | Espera 2 min después de habilitar Pages. Limpia cache (Cmd+Shift+R) |
| No puedo guardar | Verifica que el token tenga permiso `repo` |

---

## 📝 Archivos

| Archivo | Propósito |
|---------|----------|
| `index.html` | App completa (HTML + CSS + JavaScript) |
| `data.json` | Datos compartidos (se actualiza automáticamente) |
| `.gitignore` | Archivos ignorados por git |
| `README.md` | Este archivo |

---

## 🎯 Cómo funciona

1. **Login:** Ingresas tu GitHub token personal
2. **Lectura:** La app descarga `data.json` del repo
3. **Edición:** Agregas un no-show
4. **Guardado:** La app hace un commit directo a `data.json` via API de GitHub
5. **Sincronización:** Todos ven los cambios en tiempo real (F5 para refrescar)

---

## ⚡ En vivo

- **URL:** `https://YOUR_USERNAME.github.io/NON-SHOW-tracker-/`
- **Datos:** Guardados en `data.json` del repo
- **Sincronización:** Instantánea (actualiza cuando haces cambios)

**Nota:** Para ver cambios hechos por otros, recarga la página (F5).

---

## 🏆 Ganador 2026

Al final del año, quien tenga más no-shows en la tabla gana. 🎉

---

## Preguntas?

Si algo no funciona:
1. Verifica que el token sea válido
2. Verifica que hayas editado `GITHUB_OWNER` correctamente
3. Abre la consola de desarrollo (F12) y mira los errores
4. Haz git pull para asegurar que el repo está actualizado
