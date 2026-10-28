#!/usr/bin/env bash
# uso: ingest.sh <folderId> <slug>  -> baixa, gera sheet/vids e thumbs 540x960 em .aiox/tmp/<slug>
FID=$1; SLUG=$2; S=${SCRATCH:-${TMPDIR:-/tmp}/ig-ingest}; OUT=$S/$SLUG; O=${REPO_ROOT:-$(git rev-parse --show-toplevel)}/.aiox/tmp/$SLUG
mkdir -p $OUT/thumbs $OUT/frames $O; cd $OUT
curl -sSL "https://drive.google.com/embeddedfolderview?id=$FID#list" | python3 -I -c "
import sys,re,html,json
s=sys.stdin.read(); t=re.search(r'<title>(.*?)</title>',s)
it=[{'id':i,'nome':html.unescape(n),'pasta':k=='drive/folders'} for k,i,n in re.findall(r'<a href=\"https://drive.google.com/(file/d|drive/folders)/([^/\"?]+)[^\"]*\"[^>]*>.*?<div class=\"flip-entry-title\">(.*?)</div>',s,re.S)]
json.dump(it,open('list.json','w'),ensure_ascii=False); print('TITLE',html.unescape(t.group(1)) if t else '?'); [print(('DIR ' if x['pasta'] else '')+x['id'],x['nome']) for x in it]"
python3 -I -c "import json;[print(x['id'],x['nome']) for x in json.load(open('list.json')) if not x['pasta']]" > files.txt
while read id nome; do case "${nome,,}" in
  *.mp4|*.mov|*.m4v) [ -s frames/$id.vid ] || curl -sSL -o frames/$id.vid "https://drive.usercontent.google.com/download?id=$id&export=download&confirm=t" ;;
  *.pdf) echo "PDF $id $nome";;
  *) curl -sSL -o thumbs/$id.jpg "https://drive.google.com/thumbnail?id=$id&sz=w720" ;;
esac; done < files.txt
ls thumbs/*.jpg >/dev/null 2>&1 && montage -label '%t' thumbs/*.jpg -tile 6x -geometry 170x255+3+3 -pointsize 7 sheet.jpg
for f in thumbs/*.jpg; do [ -e "$f" ] || continue; id=$(basename $f .jpg); convert $f -resize 540x960^ -gravity center -extent 540x960 -quality 82 $O/$SLUG-$id.jpg; done
for v in frames/*.vid; do [ -e "$v" ] || continue; id=$(basename $v .vid); d=$(ffprobe -v error -show_entries format=duration -of csv=p=0 $v); wh=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 $v); echo "VIDEO $id dur=$d size=$wh"; for k in 0 1 2 3 4 5; do t=$(python3 -c "print(round($d*($k+0.5)/6,2))"); ffmpeg -v error -y -ss $t -i $v -frames:v 1 -vf scale=140:-1 frames/${id}_$k.jpg; done; montage frames/${id}_?.jpg -tile 6x1 -geometry +2+2 frames/strip_$id.jpg
  ffmpeg -v error -y -ss 1.5 -i $v -frames:v 1 -vf "scale=540:960:force_original_aspect_ratio=increase,crop=540:960" -q:v 4 $O/$SLUG-$id.jpg; done
ls frames/strip_*.jpg >/dev/null 2>&1 && montage -label '%t' frames/strip_*.jpg -tile 1x -geometry +0+4 vids.jpg
echo THUMBS $(ls $O | wc -l)
