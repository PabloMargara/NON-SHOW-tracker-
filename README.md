# 📊 UXR No-Show Tracker 2026

Dashboard online para el equipo UXR. Registro de no-shows con autenticación Google y base de datos Supabase.

**Equipo:** Anna · Aleja · Hector · Pablo

**Stack:** HTML estático en GitHub Pages · Supabase (PostgreSQL + Auth) · Google OAuth

---

## 🚀 Setup

Ver **`SETUP.md`** para instrucciones completas paso a paso.

En resumen:
1. Crear proyecto en [supabase.com](https://supabase.com)
2. Correr `supabase_setup.sql` en el SQL Editor de Supabase
3. Configurar Google OAuth en Google Cloud + Supabase
4. Pegar `SUPABASE_URL` y `SUPABASE_ANON` en `index.html`
5. Push a GitHub → Activar GitHub Pages

---

## 📁 Archivos

| Archivo | Propósito |
|---------|----------|
| `index.html` | App completa (HTML + CSS + JS, una sola página) |
| `supabase_setup.sql` | SQL para crear la tabla y políticas en Supabase |
| `SETUP.md` | Guía de setup detallada con todos los pasos |
| `README.md` | Este archivo |

---

## 📱 Uso diario

1. Abre la URL de GitHub Pages
2. Click **"Entrar con Google"**
3. Selecciona el miembro del equipo + fecha
4. Click **"Registrar"**

Los datos se guardan en Supabase y todos los ven en tiempo real.

---

## 🏆 A fin de año

El que tenga más no-shows en el ranking gana. 🎉
