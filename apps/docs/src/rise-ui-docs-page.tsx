import type {Metadata} from "next";
import {createElement} from "react";
import type {ComponentProps, ComponentType} from "react";

import {createRelativeLink} from "fumadocs-ui/mdx";
import {DocsBody, DocsDescription, DocsPage, DocsTitle} from "fumadocs-ui/page";
import {notFound} from "next/navigation";

import {getMDXComponents} from "./mdx-components";
import {source} from "./lib/source";

type DocPageData = {
  title: string;
  description?: string;
  body: ComponentType;
  toc: ComponentProps<typeof DocsPage>["toc"];
  full?: boolean;
};

export default async function RiseUiDocsPage(props: {params: Promise<{slug?: string[]}>}) {
  const params = await props.params;
  const page = source.getPage(params.slug);

  if (!page) notFound();

  const data = page.data as DocPageData;
  const MDXContent = data.body;

  return (
    <DocsPage full={data.full} toc={data.toc}>
      <DocsTitle>{data.title}</DocsTitle>
      <DocsDescription>{data.description}</DocsDescription>
      <DocsBody>
        {createElement(MDXContent as ComponentType<{components: ReturnType<typeof getMDXComponents>}>, {
          components: getMDXComponents({
            a: createRelativeLink(source, page),
          }),
        })}
      </DocsBody>
    </DocsPage>
  );
}

export async function generateMetadata(props: {
  params: Promise<{slug?: string[]}>;
}): Promise<Metadata> {
  const params = await props.params;
  const page = source.getPage(params.slug);

  if (!page) notFound();

  const data = page.data as DocPageData;

  return {
    description: data.description,
    title: data.title,
  };
}

export function generateStaticParams() {
  return source.generateParams();
}
