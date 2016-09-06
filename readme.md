## About this repo

The contents of this repo (data, scripts) can be used to create test CDs in a number of different CD layouts. The script uses [mkisofs](http://linux.die.net/man/8/mkisofs) and [cdrecord](http://linux.die.net/man/1/cdrecord). More materials will be added over time.

**Note that the scripts and the CDs created with them have a number of issues, see explanation at bottom of this readme!!**

## Using the scripts

Download the contents of this repo or clone it with Git. Open the [configuration file](/config.txt), check the value of the `cdDevice` variable, and modify it if necessary. Insert a blank CD in the CD/DVD drive, and run one of the bash scripts.

## Description of scripts

|Script|Description|
|:--|:--|
|[dataSingleSession.sh](/dataSingleSession.sh)|Creates data CD-ROM with one session|
|[dataMultiSession.sh](/dataMultiSession.sh)|Creates data CD-ROM with two sessions (both sessions contain different data)|
|[audio.sh](/audio.sh)|Creates audio CD with one session|
|[audioAndDataSingleSession.sh](/audioAndDataSingleSession.sh)|Creates mixed data / audio CD with one session. First track contains data; all other tracks are audio tracks. **Warning**: some CD players will interpret the data track as audio, resulting in some **really loud and unpleasant noise!** To avoid damage to your ears and/or speakers you may want to keep the volume down to a very low level whenever you play this CD.|
|[audioAndDataMultiSession.sh](./audioAndDataMultiSession.sh)|Creates mixed data / audio CD with two sessions. The first session contains all audio tracks; the second session holds the data track.|

## Issues

Creating a bunch of CDs seems like a pretty trivial task, yet I encountered a number of problems while trying to use these scripts:

- Initially I was using the [*cdrkit*](https://en.wikipedia.org/wiki/Cdrkit) tools *mkisofs* and *wodim*. Even the scripts ran without any problems on my machine, it turned out that the written data tracks were corrupted in most cases (the last bytes were usually unreadable). Moreover the multisession CDs were not recoignised at all by the DVD drive of my Windows machine. I suspected this to be related to a known [bug in cdrkit](https://bugzilla.redhat.com/show_bug.cgi?id=1065802).
- As cdrkit hasn't been updated in ages, I then had another try with cdrtools. However this introduced new problems with the multisession scripts. First, running *cdrecord* with the *-msinfo* switch after the first session failed. Ejecting the tray, closing it again and then a re-try appears to remedy this. However, in all cases trying to burn the second session resulted in the following error:

        cdrecord: Input/output error. write_g1: scsi sendcmd: no error

And no data was written. This could either be:

1. a bug in cdrecord or mkisofs
2. an issue with the hardware I'm using
3. something I'm doing wrong myself.

## Resources

* [CD Writing Howto - MULTISESSION CD-ROMS](http://howto-pages.org/cdwriting/08.php)
* [CD Writing Howto - MIXING AUDIO AND DATA ON A CD](http://howto-pages.org/cdwriting/11.php) - describes both single-session and multisession methods
* [Creating multi-session CD's Mini Howto FAQ (Cdrtools documentation)](http://cdrtools.sourceforge.net/private/man/README/README.multi)