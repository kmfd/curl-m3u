M3U Downloader
================

Overview
--------

This is a Windows batch script designed to download files from a list of URLs specified in an M3U file.

### Usage

To use this script, simply run it from the command line and provide the following arguments:

* `m3u_file`: The path to the M3U file containing the list of URLs to download.
* `parent_dir`: The parent directory where the downloaded files will be saved.

### Example

```bash
m3u_downloader.bat playlist.m3u C:\Downloads
```
This will create a new directory with the same name as the M3U file (without the extension) inside the specified parent directory, and download the files from the M3U file into that directory.

### How it Works

1. The script reads the M3U file and extracts the URLs that start with "https".
2. It creates a new directory with the same name as the M3U file (without the extension) inside the specified parent directory.
3. It loops through the extracted URLs and checks if the corresponding file already exists in the download directory.
4. If the file does not exist, it downloads the file using `curl` and saves it to the download directory.
5. If the file already exists, it skips the download and prints a message indicating that the file already exists.

### Requirements

* Windows operating system
* `curl` command-line tool (available for download from the official website)

### License

This script is licensed under the GPL3 License
