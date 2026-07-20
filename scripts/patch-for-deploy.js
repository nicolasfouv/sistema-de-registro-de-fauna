/**
 * Script pós-build para deploy no Render.
 *
 * Corrige o srf-shared-types para compatibilidade com Node.js em runtime:
 * 1. Adiciona extensões .js nos imports relativos dos arquivos compilados
 * 2. Atualiza o package.json para apontar para o output compilado
 *
 * Este script roda APENAS durante o build no Render — nenhum arquivo fonte é modificado no repositório.
 */
const fs = require("fs");
const path = require("path");

const distDir = path.join(__dirname, "..", "srf-shared-types", "dist", "src");
const pkgPath = path.join(
  __dirname,
  "..",
  "srf-shared-types",
  "package.json"
);

// Adiciona extensões .js nos imports relativos de todos os arquivos JS compilados
const files = fs.readdirSync(distDir).filter((f) => f.endsWith(".js"));
for (const file of files) {
  const filePath = path.join(distDir, file);
  let content = fs.readFileSync(filePath, "utf8");
  content = content.replace(
    /from "(\.\.?\/[^"]+)"/g,
    (match, importPath) =>
      importPath.endsWith(".js") ? match : `from "${importPath}.js"`
  );
  fs.writeFileSync(filePath, content);
}

// Atualiza o package.json para usar o output compilado em vez do source TS
const pkg = JSON.parse(fs.readFileSync(pkgPath, "utf8"));
pkg.main = "./dist/src/index.js";
pkg.types = "./dist/src/index.d.ts";
pkg.exports = { ".": "./dist/src/index.js" };
fs.writeFileSync(pkgPath, JSON.stringify(pkg, null, 2));

console.log(`Patched ${files.length} JS files and package.json for production.`);
