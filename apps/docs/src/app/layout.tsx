import type {Metadata} from "next";
import type {ReactNode} from "react";

import {RiseUiDocsAppShell} from "../rise-ui-docs-app-shell";

import "./global.css";

/** Public site (Risition). Docs route: /riseui/docs */
const siteUrl = "https://www.risition.com";

export const metadata: Metadata = {
  metadataBase: new URL(siteUrl),
  title: {
    default: "RiseUI Documentation",
    template: "%s | RiseUI",
  },
  description:
    "RiseUI — a minimal Flutter component library. Native widgets, consistent API.",
  openGraph: {
    siteName: "RiseUI",
    type: "website",
    url: `${siteUrl}/riseui/docs`,
  },
};

export default function RootLayout({children}: {children: ReactNode}) {
  return (
    <html className="min-h-screen" lang="en" suppressHydrationWarning>
      <body className="flex min-h-screen flex-col">
        <RiseUiDocsAppShell>{children}</RiseUiDocsAppShell>
      </body>
    </html>
  );
}
