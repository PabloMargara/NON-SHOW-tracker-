# ⚡ Setup Rápido - UXR No-Show Tracker

## Paso 1: Pablo crea el repo (5 min)

```bash
# En tu terminal, entra a la carpeta
cd "NON-SHOW - Counter"

# Edita index.html (línea ~621)
nano index.html
# Busca:
#   const GITHUB_OWNER = 'YOUR_USERNAME';
# Cambio a:
#   const GITHUB_OWNER = 'PabloMargara';  # Tu usuario de GitHub
# Ctrl+X, Y, Enter para guardar

# Sube a GitHub
git init
git add .
git commit -m "Initial: UXR No-Show Tracker 2026"
gh repo create NON-SHOW-tracker- --public --source=. --push
```

## Paso 2: Activa GitHub Pages (1 min)

1. Ve a GitHub → tu repo `NON-SHOW-tracker-`
2. **Settings** → **Pages**
3. Bajo "Build and deployment":
   - Source: selecciona **GitHub Actions**
4. Haz push a `main`
5. Espera a que termine el workflow **Deploy GitHub Pages**

Espera 1-2 minutos. Tu URL será:
```
https://PabloMargara.github.io/NON-SHOW-tracker-/
```

## Paso 3: Todos generan su token (2 min cada uno)

**En GitHub:**
1. Click tu avatar → **Settings**
2. Left menu → **Developer settings**
3. → **Personal access tokens**
4. → **Tokens (classic)**
5. Click **Generate new token (classic)**

**En el formulario:**
- Note: `NON-SHOW-tracker`
- Scope: selecciona **`repo`** (checkbox)
- Click **Generate token** abajo
- **COPIA EL TOKEN** (aparece una sola vez)

## Paso 4: Comparte la URL

Envía esto a Anna, Aleja y Hector:

```
Dashboard: https://PabloMargara.github.io/NON-SHOW-tracker-/
(Reemplaza "PabloMargara" con tu usuario de GitHub)
```

## Listo 🎉

Cada persona:
1. Abre el link en su navegador
2. Click **"Agregar Token"**
3. Pega su token personal
4. Ya puede registrar no-shows

---

## Debugging

### Si ves error "Error al cargar"
- [ ] Espera 2 minutos después de activar Pages
- [ ] Limpia cache: Cmd+Shift+R (Mac) o Ctrl+Shift+R (Windows)
- [ ] Verifica que `GITHUB_OWNER` sea tu usuario real

### Si ves 404 en GitHub Pages
- [ ] Verifica que Pages esté configurado con **GitHub Actions**
- [ ] Revisa la pestaña **Actions** y confirma que `Deploy GitHub Pages` terminó bien
- [ ] Confirma que los cambios ya estén en `main`

### Si el token no funciona
- [ ] Verifica que hayas seleccionado scope `repo`
- [ ] Genera un token nuevo
- [ ] Logout y vuelve a entrar

### Para ver cambios de otros
- [ ] Presiona F5 para refrescar la página

---

## Después, para agregar más entradas

- Cad alguien abre la URL
- Ingresa su token (se guarda en su navegador)
- Registra el no-show
- Listo, todos ven el cambio inmediatamente
