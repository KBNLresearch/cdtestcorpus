## About this repo

The contents of this repo (data, scripts) can be used to create test CDs in a number of different CD layouts. The script uses [mkisofs](http://linux.die.net/man/8/mkisofs) and [wodim](http://linux.die.net/man/1/wodim). More materials will be added over time.

## Using the scripts

Download the contents of this repo or clone it with Git. Open the [configuration file](/config.txt), check the value of the `cdDevice` variable, and modify it if necessary. Insert a blank CD in the CD/DVD drive, and run one of the bash scripts.

## Description of scripts

|Script|Description|
|:--|:--|
|[dataSingleSession.sh](/dataSingleSession.sh)|Creates data cd-ROM with one session|
|[dataMultiSession.sh](/dataMultiSession.sh)|Creates data cd-ROM with two sessions (both sessions contain different data)|
|[audio.sh](/audio.sh)|Creates audio CD with one session|
|[audioAndDataSingleSession.sh](/audioAndDataSingleSession.sh)|Creates mixed data / audio CD with one session. First track contains data; all other tracks are audio tracks|
|[audioAndDataMultiSession.sh](./audioAndDataMultiSession.sh)|Creates mixed data / audio CD with two sessions. The first session contains all audio tracks; the second session holds the data track.|


## Resources

* [CD Writing Howto - MULTISESSION CD-ROMS](http://howto-pages.org/cdwriting/08.php)
* [CD Writing Howto - MIXING AUDIO AND DATA ON A CD](http://howto-pages.org/cdwriting/11.php) - describes both single-session and multisession methods