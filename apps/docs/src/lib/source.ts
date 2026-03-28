import type {InferMetaType, InferPageType} from "fumadocs-core/source";
import {loader} from "fumadocs-core/source";

import {docs} from "../../.source/server";

export const source = loader({
  /**
   * Empty: `next.config` `basePath` (`/riseui/docs`) already prefixes all routes.
   * A non-empty `baseUrl` here would duplicate the segment in `Link` hrefs (e.g. on www.risition.com).
   */
  baseUrl: "",
  source: docs.toFumadocsSource(),
});

export type Page = InferPageType<typeof source>;
export type Meta = InferMetaType<typeof source>;
