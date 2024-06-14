> This has been originally pulled from the following Gist. [https://gist.github.com/zekroTJA/c4fc758e45d2b385440778b94be6b57a](https://gist.github.com/zekroTJA/c4fc758e45d2b385440778b94be6b57a)

# Using ffmepg to 'cut' your videos

## The advantage over using a "classical" cutting program

If you record your videos with OBS, you can record them in the format of **mp4**, which is actually [container format](https://en.wikipedia.org/wiki/MPEG-4_Part_14), which includes video, audio _(and other stuff like subtitles for example)_ in a container file. With ffmpeg, you are able to extract and work with those streams in the containers. That means, you can extract and edit streams directly from and inside the container without rendering the whole video file, which saves a huge ammount of time and resources.

## Install ffmpeg

Go to [ffmpeg.org](https://ffmpeg.org/) and download the latest build for your system. If you are using linux, you can also install it by your package manager of course. If you decided to download the binaries, place them somewhere you want _(on Windows C:/Program Files/ffmpeg/ for example)_ and define the location of the "bin" folder in the ffmpeg folder in your path variables.

For linux, you can set the following command to your `.profile` file:

```bash
export PATH=$PATH:{pathToffmpeg}/bin
```

For windows, see [this](https://www.computerhope.com/issues/ch000549.htm#windows8) post.

Then, you should be able to use the command `ffmpeg` in your console.

## Seperate the audio tracks from your video

After recording a video, of course, you can figure out the stream ID's of your video file by using the command:

```
ffmpeg -i rec.mp4

```

Then, you will see an output like following:

```
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'rec.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf57.84.100
  Duration: 00:00:14.80, start: 0.000000, bitrate: 16629 kb/s
    Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv), 1920x1080 [SAR 1:1 DAR 16:9], 15982 kb/s, 60 fps, 60 tbr, 1536
0 tbn, 120 tbc (default)
    Metadata:
      handler_name    : VideoHandler
    Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 328 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
    Stream #0:2(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 307 kb/s
    Metadata:
      handler_name    : SoundHandler
```

There, you see, that stream `#0:0` is your video track and `#0:1` and `#0:2` are your audio streams, desktop and microphone in this case.

### Extract audio streams

To extract the both audio streams, use the following command:

```
ffmpeg -i rec.mp4 -map 0:1 -vn -c copy audio_bg.aac
```

> flag -vn means, that the result should not contain any video information
> 
> flag `-c copy` implies, that the audio will be copied 1:1 out of the container, so you can only use `aac` as outptu format, because the origin audio stream is aac as you can see above.

Do the same for track `#0:2`.

If you want to convert the result audio file, for example, to an mp3 file, you need to do the following:

```
ffmpeg -i rec.mp4 -map 0:1 -vn -acodec mp3 audio_bg.aac
```

> That means tho, that the audio stream will be converted, which can take up some time depending on the file length and the performance of your system.

Now, you can use whatever you want to edit the audio streams.

### Change the volume of an audio track

You can also change the volume of a audio tarck with ffmpeg by the following command:

```
ffmpeg -i audio_bg.aac -filter:a "volume=-10db" audio_bg_leveled.aac
```

### Concat video or audio streams

You can also easily concat video and audio files with ffmpeg.

For this, first you need to create a file containig a list of all input files. This will look like following:

> inputs.txt

```
file 'rec1.mp4'
file 'rec2.mp4'
```

Then, use following command:

```
ffmpeg -f concat -i inputs.txt rec_concat.mp4
```

### Cut a video

Also, you can cut a video with ffmpeg **without the need of rendering the video**, which is way faster than cutting the video with a cutting program like Premiere Pro or something like this.

Our video has a length of 14 seconds with a size of 29.3 MB.

We want to cut the first 2 seconds and the last 4 seconds. So the video will have a length of 8 seconds. That results in the following command:

```
ffmpeg -i rec.mp4 -ss 2 -t 8 -c copy rec_cutted.mp4

```

> flag -c copy implies, that the streams will only be cutted and not re-rendered.

The result file is 8 seconds long with a size of 15.5 MB _(of course, because it has only half the length of the original)_.

### Merge different audio streams to one stream

If you have multiple audio streams, you can also merge them together with ffmpeg by using the following command:

```
ffmpeg -i audio_bg.aac -i audio_mic_afx.mp3 -filter_complex amerge -q:a 0 audio_merged.mp3

```

> flag -q:a 0 implies that the audio quality setting of stream 0 will be used. That is important to define, otherwise ffmpeg will use a default quality setting and it could mess up your result files audio quality.

### Merge a video and an audio track

If you want a result video with only the video and one edited audio track, you first need to figure out the stream ID's our you files you want to use for the result.

```
ffmpeg -i rec.mp4 -i audio_merged.mp3

```

Result:

```
Input #0, mov,mp4,m4a,3gp,3g2,mj2, from 'rec.mp4':
  Metadata:
    major_brand     : isom
    minor_version   : 512
    compatible_brands: isomiso2avc1mp41
    encoder         : Lavf57.84.100
  Duration: 00:00:14.80, start: 0.000000, bitrate: 16629 kb/s
    Stream #0:0(und): Video: h264 (High) (avc1 / 0x31637661), yuv420p(tv), 1920x1080 [SAR 1:1 DAR 16:9], 15982 kb/s, 60 fps, 60 tbr, 15360 tbn, 120 tb
c (default)
    Metadata:
      handler_name    : VideoHandler
    Stream #0:1(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 328 kb/s (default)
    Metadata:
      handler_name    : SoundHandler
    Stream #0:2(und): Audio: aac (LC) (mp4a / 0x6134706D), 44100 Hz, stereo, fltp, 307 kb/s
    Metadata:
      handler_name    : SoundHandler
Input #1, mp3, from 'audio_merged.mp3':
  Metadata:
    encoder         : Lavf58.25.100
  Duration: 00:00:14.84, start: 0.025057, bitrate: 128 kb/s
    Stream #1:0: Audio: mp3, 44100 Hz, stereo, fltp, 128 kb/s
    Metadata:
      encoder         : Lavc58.42

```

Now, we use the information above and merge the video stream from file #0 (`0:0`) for stream `0` in result file and the audio stream of file #1 (`1:0`) in stream `1` in result file. That gives the following command:

```
ffmpeg -i rec.mp4 -i audio_merged.mp3 -map 0:0:0 -map 1:0:1 -c copy result.mp4

```

> flag -map 0:0:0 means that stream 0 from input file 0 will be stream 0 in result
> 
> flag `-map 1:0:1` means that stream 0 from input file 1 will be stream 1 in result

---

## Useful resources:

- [https://ffmpeg.org/documentation.html](https://ffmpeg.org/documentation.html)
- [http://keycorner.org/pub/text/doc/ffmpeg-tutorial.htm](http://keycorner.org/pub/text/doc/ffmpeg-tutorial.htm)
- [https://www.youtube.com/watch?v=MPV7JXTWPWI](https://www.youtube.com/watch?v=MPV7JXTWPWI)