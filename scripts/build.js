import { build } from 'esbuild'
import { nodeExternalsPlugin } from 'esbuild-node-externals'

build({
  entryPoints: ['./src/index.ts'],

  format: 'esm',
  platform: 'node',
  // target: 'esnext',
  outfile: 'bin/index.js',

  bundle: true,
  minify: false,
  sourcemap: false,

  external: ['fs', 'path'],
  plugins: [nodeExternalsPlugin()]
}).catch(() => process.exit(1))
