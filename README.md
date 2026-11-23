# Avara Sands website

Static site, no build step. Open `index.html` through any web server.

```
index.html        page markup (all views, hash-routed)
css/style.css     all styles
js/main.js        all scripts (routing, i18n dictionary, booking popup, map)
images/           photos (WebP)
media/hero-av1.mp4 hero video, AV1 (smaller, modern browsers)
media/hero.mp4    hero video, H.264 fallback
robots.txt        blocks search engines while this is a preview
.nojekyll         tells GitHub Pages to serve files as they are
_archive/         the old single-file version (not published, ignored by Git)
```

## Preview locally

```
ruby -run -e httpd . -p 8000
```

Then open http://localhost:8000.

## Publish on GitHub Pages

1. Install Apple's command line tools (gives you `git`): `xcode-select --install`
2. Create an empty repository on github.com (for example `avara-sands`). Private is fine on a paid plan; on a free plan Pages needs a public repository.
3. In this folder:
   ```
   git init -b main
   git add .
   git commit -m "Avara Sands site"
   git remote add origin https://github.com/YOUR-USER/avara-sands.git
   git push -u origin main
   ```
4. On GitHub: Settings → Pages → Source: "Deploy from a branch", Branch: `main`, folder `/ (root)`.
5. The site appears at `https://YOUR-USER.github.io/avara-sands/` after a minute or two.

All paths are relative, so the site works under that sub-path and on a custom domain.

## At launch

- Remove `<meta name="robots" content="noindex, nofollow">` from `index.html`.
- Replace `robots.txt` with the commented "at launch" version inside it.
- Add the custom domain under Settings → Pages (this creates a `CNAME` file).

## Versions and undo

Every commit is a complete copy of the site, kept on this Mac and on GitHub. Publishing a new version never deletes an old one.

- **See past versions:** on GitHub, open **Commits** and click **Browse files** next to any entry.
- **Named versions:** listed under **Tags**. `v1-preview` is the first preview (site split into files, WebP photos, compressed video).
- **Undo a change:** use `git revert <commit>` (or ask Claude to "go back to v1-preview" / "undo the last change"), then push. This adds a new commit that restores the old version, so the history stays complete.
- **Routine:** change → check on a local preview → commit → push once approved. GitHub Pages updates about 30 seconds after a push.
