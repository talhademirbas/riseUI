"use client";

import "./suppress-react19-theme-script-warning";

import type {ReactNode} from "react";

import {RootProvider} from "fumadocs-ui/provider/next";

export function RiseUiRootProvider({children}: {children: ReactNode}) {
  return <RootProvider>{children}</RootProvider>;
}
