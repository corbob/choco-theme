yarn up -R astro rehype-mermaid remark-custom-header-id '@astrojs/mdx' '@astrojs/node' '@astrojs/rss' '@astrojs/sitemap' | out-null
git commit -am 'Update astro dependencies' --allow-empty
yarn audit --json|convertfrom-json | % value | sort -unique | % { 
Write-Host -ForegroundColor Cyan $_
yarn up -R $_ | Out-Null
git commit -am "Update $_" --allow-empty
}
yarn audit
