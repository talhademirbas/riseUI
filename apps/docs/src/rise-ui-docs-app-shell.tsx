import type {ReactNode} from "react";

import {NextProvider} from "fumadocs-core/framework/next";
import {TreeContextProvider} from "fumadocs-ui/contexts/tree";

import {RiseUiRootProvider} from "./app/custom-root-provider";
import {source} from "./lib/source";

/** Shared shell for the docs tree (used by the standalone docs app and by risitionWeb). */
export function RiseUiDocsAppShell({children}: {children: ReactNode}) {
  return (
    <NextProvider>
      <TreeContextProvider tree={source.pageTree}>
        <RiseUiRootProvider>{children}</RiseUiRootProvider>
      </TreeContextProvider>
    </NextProvider>
  );
}
