# 🔄 Dos Versiones Disponibles

## Versión ONLINE (Recomendada) ⭐

**Archivo:** `index.html` (versión nueva)

✅ Ventajas:
- Accesible desde cualquier navegador
- No necesitas ejecutar nada en tu Mac
- Todos ven los datos en tiempo real
- GitHub Pages maneja el hosting (gratis)
- Datos siempre en GitHub

❌ Requisitos:
- Repo en GitHub (puede ser público)
- Token personal de GitHub para cada persona
- Esperar ~2 minutos después de habilitar Pages

**Setup:** Ver `SETUP.md`

---

## Versión LOCAL (Legacy)

**Archivos:** `server.py` + `noshow.sh`

✅ Ventajas:
- Totalmente privado (sin subir a GitHub)
- No necesitas tokens
- Funciona offline

❌ Requisitos:
- Ejecutar `./noshow.sh` en Terminal cada vez
- Todos en el equipo necesitan clonar el repo
- Necesitan hacer git push/pull manualmente

**Setup:**
```bash
./noshow.sh
```

---

## Recomendación

Para tu caso (4 personas en Macs), **usa la versión ONLINE**:

1. ✨ Más fácil (un link, listo)
2. 🔄 Sincronización automática
3. 📱 Funciona desde cualquier dispositivo
4. 🎯 Sin dependencias en tu Mac

---

## Decisión

Si quieres usar **online**, sigue `SETUP.md`.

Si prefieres **local**, usa los scripts legacy: `./noshow.sh`.

---

## Migración futura

Si empiezas con online y quieres cambiar a local (o viceversa):
- Ambas versiones usan el mismo `data.json`
- Solo copia los datos entre versiones si necesitas
