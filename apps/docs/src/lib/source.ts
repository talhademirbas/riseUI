import type {InferMetaType, InferPageType} from "fumadocs-core/source";
import {loader} from "fumadocs-core/source";

import {docs} from "../../.source/server";

export const source = loader({
  baseUrl: "/riseui/docs",
  source: docs.toFumadocsSource(),
});

export type Page = InferPageType<typeof source>;
export type Meta = InferMetaType<typeof source>;
