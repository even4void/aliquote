---
title: "Remove EXIF data from photos"
date: 2026-08-02T11:59:53+02:00
draft: true
tags: ["this"]
categories: ["2026"]
---

I'm being so lazy these days that I often find myself dragging and dropping
photos from Apple Photos onto my Desktop, which does not strip out EXIF data,
in particular geolocalisation and time zone. I still want to keep original ICC
profile. I could use Apple Photos own facilities to remove metadata, or, says,
[ImageOptim][1], but I want to automate things as much as possible. Plus I have
plenty of JPEGs that are lying around and I'm not sure about their state.
[Exiftool][2] comes to the rescue, and it has been discussed [here][3] and
[there][4]. Contrary to Dave Gauer, I do not track images added to my blog with
Git so that I cannot use `git ls-files` or `git diff-index` like I do in my
Makefile to add recently modified files. However, I could check which image
files were added since the last commit using Bash and remove metadata easily.

For now I just want to quickly remove extraneous metadata from existing files.
Running `exiftool -gps:all -time:all` shows everything associated with the file.
Clearing up all this is just a matter of typing:

```shell
aliquote master?
» exiftool -time:all -gps:all static/img/IMG_1672.jpeg
File Modification Date/Time     : 2026:08:02 14:00:07+02:00
File Access Date/Time           : 2026:08:02 14:00:09+02:00
File Inode Change Date/Time     : 2026:08:02 14:00:07+02:00
Profile Date Time               : 2022:01:01 00:00:00
```

Note that this keeps the original picture using a dedicated suffix
(`_original`) but it is easy to overwrite the file instead. Here's a quick Bash
script that does the job on all pictures in JPEG format: (I do not rely on the
mimetype, `image/jpeg`, but that might be a safer way to proceed all files
without worrying about file extension.)

```bash
wd="static/img"
total=$(ls $wd/*.{jpg,jpeg,JPG,JPEG} | wc -l)
counter=0
for f in $wd/*.{jpg,jpeg,JPG,JPEG}
do
  if [[ $(exiftool -gps:all "$f") ]]; then
      exiftool -time:all= -gps:all= -overwrite_original_in_place "$f"
      ((counter++))
  fi
done
echo "$counter out of $total files updated"
```

As for integrating the above into my Git workflow, I can simply check the date
of the last commit and list files created since then:

```shell
aliquote master?
» lastcommit=$(git --no-pager log -1 --format="%ai")

aliquote master?
» find static/img -maxdepth 1 -type f -newermt "$lastcommit"
static/img/IMG_1672.jpeg
```

The above `for` loop will do the job for those files.

[1]: https://imageoptim.com
[2]: https://exiftool.org
[3]: https://ratfactor.com/cards/exiftool-strip
[4]: https://superuser.com/a/1840356

{{% music %}}Placebo • *Been Smoking Too Long*{{% /music %}}
