/**
 * `next-themes` (used by fumadocs `RootProvider`) injects a small inline script to prevent theme FOUC.
 * React 19 logs a false-positive in development: scripts still run as intended.
 * @see https://github.com/pacocoursey/next-themes/issues/337
 */
if (process.env.NODE_ENV === "development") {
  const orig = console.error;
  console.error = (...args: unknown[]) => {
    if (
      typeof args[0] === "string" &&
      args[0].includes("Encountered a script tag while rendering React component")
    ) {
      return;
    }
    orig.apply(console, args as never[]);
  };
}
