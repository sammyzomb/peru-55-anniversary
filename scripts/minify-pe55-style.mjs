/**
 * Minify the first <style type="text/css">...</style> block in Peru55 feature HTML files.
 * Uses clean-css-cli @5 -O1 (conservative; keeps semantics).
 */
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import { spawnSync } from "child_process";

const __dirname = path.dirname(fileURLToPath(import.meta.url));
const root = path.resolve(__dirname, "..");
const tmpIn = path.join(root, "貼官網用", "_pe55_style_minify_in.css");
const tmpOut = path.join(root, "貼官網用", "_pe55_style_minify_out.css");

const targets = [
  path.join(root, "貼官網用", "行程特色_開發版.html"),
  path.join(root, "貼官網用", "行程特色_貼上版.html"),
  path.join(root, "貼官網用", "行程特色_基準範本_開發版.html"),
  path.join(root, "貼官網用", "行程特色_基準範本_貼上版.html"),
];

const styleRe = /(<style[^>]*>)([\s\S]*?)(<\/style>)/i;

function minifyWithCli(css) {
  fs.writeFileSync(tmpIn, css, "utf8");
  const cmd =
    process.platform === "win32"
      ? `npx.cmd --yes clean-css-cli@5.3.3 -O1 -o "${tmpOut}" "${tmpIn}"`
      : `npx --yes clean-css-cli@5.3.3 -O1 -o "${tmpOut}" "${tmpIn}"`;
  const r = spawnSync(cmd, { cwd: root, shell: true, encoding: "utf8" });
  if (r.status !== 0) {
    throw new Error((r.stderr || r.stdout || "") + "\nexit " + r.status);
  }
  return fs.readFileSync(tmpOut, "utf8").trim();
}

for (const filePath of targets) {
  const html = fs.readFileSync(filePath, "utf8");
  const m = html.match(styleRe);
  if (!m) {
    console.error("Skip (no <style>):", filePath);
    continue;
  }
  const open = m[1];
  const css = m[2].trim();
  const close = m[3];
  const before = Buffer.byteLength(css, "utf8");
  const min = minifyWithCli(css);
  const after = Buffer.byteLength(min, "utf8");
  const newHtml = html.replace(styleRe, open + min + close);
  fs.writeFileSync(filePath, newHtml, "utf8");
  console.log(path.relative(root, filePath), "style UTF-8:", before, "->", after, "saved", before - after);
}

try {
  fs.unlinkSync(tmpIn);
  fs.unlinkSync(tmpOut);
} catch {
  /* ignore */
}
console.log("OK");
