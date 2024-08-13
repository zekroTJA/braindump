> This has been originally pulled from the following Gist. [https://gist.github.com/zekroTJA/d7985ffcb05a38a47a3b45eb85fc2133](https://gist.github.com/zekroTJA/d7985ffcb05a38a47a3b45eb85fc2133)

## Speed up or slow down

```
ffmpeg -r 10 -i speed2.mp4 -filter:v "setpts=0.1*PTS" -r 60 out.speed2.mp4
```

- `-r` Specifies the framerates of the video files
- `-filter:v "setpts=0.1*PTS"` Specifies that the output video is 10 times faster than the original

---

## Blur video

```
ffmpeg -i intro_raw.mkv -filter_complex "boxblur=20:2" intro_blured_2.mkv
```

[Docs](https://ffmpeg.org/ffmpeg-filters.html#boxblur)

---

## Slice video

```
ffmpeg -i input.mp4 -ss <startTimeInSeconds> -t <durationInSeconds> -c copy output.mp4
```

---

## Attach multiple videos

1. Create a text file with all seperate files like this

`inputs.txt`

```
file 'cut.out.speed1.mp4'
file 'cut.out.speed2.mp4'
```

1. Execute command

```
ffmpeg -f concat -i inputs.txt -c copy outfinal.mp4
```

---

## Extract specific audio track from video

```
ffmpeg -i test.mp4 -map 0:2:a -vn -c copy audio_mic.aac
```

---

## Merge audio tracks in video

```
ffmpeg -i test.mp4 -i audio_mic.mp3 -filter_complex amerge -map 0:a:0 -map 0:v:0 merged.mp4
```

## Extract Alpha Layer from Video

```
ffmpeg -i INTRO.avi -vf alphaextract,format=yuv420p INTRO_alpha.mp4
```

## Normalize Audio

```
ffmpeg -i ./oof.mp3 -af loudnorm=I=-16:TP=-0.3:LRA=11 ./normalized/oof.mp3
```

## Receive RTMP Stream From OBS, for exmaple

```
ffplay -fflags nobuffer -listen 1935 rtmp://0.0.0.0
```

## Scale Image

```
ffmpeg -i input.jpg -vf scale=320:-1 output_320.png
```

*[Source](https://trac.ffmpeg.org/wiki/Scaling)*