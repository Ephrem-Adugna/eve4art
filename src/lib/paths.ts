/** Prefix an in-site path with Astro's base (for example /eve4art on GitHub Pages). */
export function withBase(path: string): string {
  if (!path || /^(?:[a-z][a-z0-9+.-]*:)?\/\//i.test(path) || path.startsWith("#") || path.startsWith("mailto:")) {
    return path;
  }
  const base = (import.meta.env.BASE_URL || "/").replace(/\/$/, "");
  const suffix = path.startsWith("/") ? path : `/${path}`;
  if (!base || base === "/") return suffix;
  return `${base}${suffix}`;
}

/** Pathname with the deploy base removed, for nav highlighting. */
export function stripBase(pathname: string): string {
  const base = (import.meta.env.BASE_URL || "/").replace(/\/$/, "");
  let path = pathname.replace(/\/$/, "") || "/";
  if (base && base !== "/" && (path === base || path.startsWith(`${base}/`))) {
    path = path.slice(base.length) || "/";
  }
  return path || "/";
}
