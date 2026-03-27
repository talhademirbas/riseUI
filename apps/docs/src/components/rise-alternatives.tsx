import type { ReactNode } from "react";

/**
 * Side-by-side “alternatives” (variants, modes) for comparing options.
 */
export function RiseAlternatives({ children }: { children: ReactNode }) {
  return (
    <div className="not-prose my-8 grid gap-4 sm:grid-cols-2">{children}</div>
  );
}

export function RiseAlternative({
  title,
  description,
  children,
}: {
  title: string;
  description?: string;
  children?: ReactNode;
}) {
  return (
    <div className="rounded-xl border border-fd-border bg-fd-card p-5 text-fd-card-foreground shadow-sm">
      <h4 className="m-0 text-base font-semibold tracking-tight">{title}</h4>
      {description ? (
        <p className="mt-2 mb-0 text-sm leading-relaxed text-fd-muted-foreground">
          {description}
        </p>
      ) : null}
      {children ? <div className="mt-4">{children}</div> : null}
    </div>
  );
}
