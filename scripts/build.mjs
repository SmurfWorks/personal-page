// Build the GitHub Pages site: copy src/ into a fresh docs/ folder.
import { cpSync, existsSync, rmSync, writeFileSync } from 'node:fs';
import { dirname, join } from 'node:path';
import { fileURLToPath } from 'node:url';

const root = join(dirname(fileURLToPath(import.meta.url)), '..');
const src = join(root, 'src');
const out = join(root, 'docs');

if (!existsSync(join(src, 'index.html'))) {
  console.error('build: src/index.html is missing.');
  process.exit(1);
}

rmSync(out, { recursive: true, force: true });
cpSync(src, out, { recursive: true });

// Serve the files as they are, without GitHub Pages running Jekyll over them.
writeFileSync(join(out, '.nojekyll'), '');

console.log('build: src/ copied to docs/');
