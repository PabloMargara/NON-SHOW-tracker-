-- ══════════════════════════════════════════════════════
--  UXR No-Show Tracker — Supabase SQL Setup
--  Corre esto en: Supabase Dashboard → SQL Editor → New Query
-- ══════════════════════════════════════════════════════

-- 1. Crear tabla de entradas
CREATE TABLE IF NOT EXISTS entries (
    id          UUID DEFAULT gen_random_uuid() PRIMARY KEY,
    member      TEXT NOT NULL CHECK (member IN ('Anna', 'Aleja', 'Hector', 'Pablo')),
    date        DATE NOT NULL,
    created_by  UUID REFERENCES auth.users(id) ON DELETE SET NULL,
    created_at  TIMESTAMPTZ DEFAULT now()
);

-- 2. Habilitar Row Level Security (RLS)
ALTER TABLE entries ENABLE ROW LEVEL SECURITY;

-- 3. Políticas de seguridad:
--    - Cualquier usuario autenticado puede LEER
--    - Cualquier usuario autenticado puede INSERTAR
--    - Solo el creador puede ELIMINAR su propia entrada

-- Leer: todos los autenticados
CREATE POLICY "Authenticated users can read entries"
    ON entries FOR SELECT
    TO authenticated
    USING (true);

-- Insertar: todos los autenticados
CREATE POLICY "Authenticated users can insert entries"
    ON entries FOR INSERT
    TO authenticated
    WITH CHECK (auth.uid() = created_by);

-- Eliminar: solo el creador
CREATE POLICY "Users can delete their own entries"
    ON entries FOR DELETE
    TO authenticated
    USING (auth.uid() = created_by);

-- 4. Índice para acelerar consultas por fecha
CREATE INDEX IF NOT EXISTS entries_date_idx ON entries(date);
CREATE INDEX IF NOT EXISTS entries_member_idx ON entries(member);

-- ── Verificación ──
-- Después de correr esto, deberías ver la tabla en Table Editor
SELECT 'Setup completado correctamente ✓' as status;
