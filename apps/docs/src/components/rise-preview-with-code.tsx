"use client";

import { Tab, Tabs } from "fumadocs-ui/components/tabs";
import type { ReactNode } from "react";

/**
 * **Preview | Code** tabs for docs pages.
 * The Preview tab embeds the Flutter web build ([RiseFlutterEmbed]) when available; otherwise use the widget shown.
 */
export function RisePreviewWithCode({
  children,
  code,
  className,
}: {
  children: ReactNode;
  /** Dart source shown in the Code tab */
  code: string;
  className?: string;
}) {
  return (
    <Tabs items={["Preview", "Code"]} defaultIndex={0} className={className}>
      <Tab>
        <div className="flex min-h-[120px] w-full justify-center bg-fd-background px-4 py-6">
          {children}
        </div>
      </Tab>
      <Tab>
        <pre className="m-0 max-h-[min(480px,70vh)] overflow-auto rounded-none border-0 bg-fd-muted/35 p-4 text-left font-mono text-[13px] leading-relaxed text-fd-foreground">
          <code>{code}</code>
        </pre>
      </Tab>
    </Tabs>
  );
}
