#!/bin/bash
# Package gate for the leadership-coach skill: frontmatter limits, no course locators, size budget.
SK="$(cd "$(dirname "$0")/.." && pwd)/skills/leadership-coach"
fail=0
python3 -I - "$SK/SKILL.md" <<'PY' || fail=1
import re,sys
t=open(sys.argv[1],encoding='utf-8').read()
m=re.match(r'^---\n(.*?)\n---\n',t,flags=re.S)
assert m,'no frontmatter'
fm=m.group(1)
name=re.search(r'^name:\s*(.+)$',fm,flags=re.M).group(1).strip()
desc=re.search(r'^description:\s*(.+)$',fm,flags=re.M).group(1).strip()
assert re.fullmatch(r'[a-z0-9-]+',name), 'bad name: '+name
assert len(fm)<=1024, 'frontmatter too long: %d'%len(fm)
assert desc.startswith('Use when'), 'description must start with "Use when"'
print('frontmatter ok: name=%s, %d chars'%(name,len(fm)))
PY
# Locator words must not appear in user-facing knowledge (Russian and English, case-insensitive),
# nor page references or timestamps.
python3 -I - "$SK/SKILL.md" "$SK"/references/*.md <<'PY' || fail=1
import re,sys,os
pat=re.compile(r'слайд|вебинар|лектор|лекци|таймкод|по словам|мини-мба|сбер|рабоч(ая|ей|ую) тетрад|расшифровк|транскрипт'
               r'|slide|webinar|lecturer|lecture|timestamp|transcript|workbook|mini-mba|\bsber|\bdeck\b'
               r'|\[\d{1,2}:\d{2}(:\d{2})?\]|\b\d{2}:\d{2}:\d{2}\b|\bсл\. ?\d|\bстр\. ?\d|\bp\. ?\d|page-\d',re.I)
bad=0
for f in sys.argv[1:]:
    for i,line in enumerate(open(f,encoding='utf-8'),1):
        if pat.search(line):
            bad+=1
            if bad<=12: print('LOCATOR in %s:%d: %s'%(os.path.basename(f),i,line.strip()[:120]))
sys.exit(1 if bad else 0)
PY
for f in "$SK"/references/*.md; do s=$(wc -c < "$f"); [ "$s" -gt 30000 ] && { echo "TOO BIG: $(basename "$f") $s bytes"; fail=1; }; done
w=$(wc -w < "$SK/SKILL.md"); [ "$w" -gt 2500 ] && { echo "SKILL.md too long: $w words"; fail=1; }
echo "sizes:"; wc -c "$SK/SKILL.md" "$SK"/references/*.md | sed 's/^/  /'; echo "  SKILL.md words: $w"
[ "$fail" -eq 0 ] && echo "GATE: PASS" || echo "GATE: FAIL"
exit $fail
