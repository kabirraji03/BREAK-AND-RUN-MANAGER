# D12 Cue Club — Break & Run Manager

GitHub Pages-ready build of the D12 Cue Club Break & Run Manager.

## Deploy

1. Create a GitHub repository, e.g. `d12-break-run-manager`.
2. Upload `index.html`, `.nojekyll`, and `supabase-setup.sql` to the repository root.
3. Go to **Settings → Pages**.
4. Under **Build and deployment**, choose **Deploy from a branch**.
5. Select **main** and **/(root)**, then Save.
6. Your app will publish at a URL like:
   `https://YOUR-USERNAME.github.io/d12-break-run-manager/`

## Supabase

1. Run `supabase-setup.sql` in Supabase SQL Editor.
2. Enable **Anonymous Sign-Ins** in Supabase Authentication.
3. Open the hosted app and enter the same:
   - Supabase Project URL
   - Publishable/Anon Key
   - Shared Event ID
4. Use the same Event ID on every phone, tablet and computer.

Never place a `service_role` key in the browser app.
