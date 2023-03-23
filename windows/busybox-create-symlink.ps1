param(
    $dir
)
$arr = @(
    "[.exe",
    "[[.exe",
    "ar.exe",
    "arch.exe",
    "ascii.exe",
    "awk.exe",
    "base32.exe",
    "base64.exe",
    "basename.exe",
    "bash.exe",
    "bc.exe",
    "bunzip2.exe",
    "bzcat.exe",
    "bzip2.exe",
    "cal.exe",
    "cat.exe",
    "chattr.exe",
    "chmod.exe",
    "cksum.exe",
    "clear.exe",
    "cmp.exe",
    "comm.exe",
    "cp.exe",
    "cpio.exe",
    "crc32.exe",
    "cut.exe",
    "cygpath.exe",
    "date.exe",
    "dc.exe",
    "dd.exe",
    "df.exe",
    "diff.exe",
    "dirname.exe",
    "dos2unix.exe",
    "dpkg-deb.exe",
    "dpkg.exe",
    "du.exe",
    "echo.exe",
    "ed.exe",
    "egrep.exe",
    "env.exe",
    "expand.exe",
    "expr.exe",
    "factor.exe",
    "false.exe",
    "fgrep.exe",
    "find.exe",
    "fold.exe",
    "free.exe",
    "fsync.exe",
    "ftpget.exe",
    "ftpput.exe",
    "getopt.exe",
    "grep.exe",
    "groups.exe",
    "gunzip.exe",
    "gzip.exe",
    "hd.exe",
    "head.exe",
    "hexdump.exe",
    "httpd.exe",
    "iconv.exe",
    "id.exe",
    "inotifyd.exe",
    "install.exe",
    "ipcalc.exe",
    "jn.exe",
    "kill.exe",
    "killall.exe",
    "less.exe",
    "link.exe",
    "ln.exe",
    "logname.exe",
    "ls.exe",
    "lsattr.exe",
    "lzcat.exe",
    "lzma.exe",
    "lzop.exe",
    "lzopcat.exe",
    "man.exe",
    "md5sum.exe",
    "mkdir.exe",
    "mktemp.exe",
    "mv.exe",
    "nc.exe",
    "nl.exe",
    "nproc.exe",
    "od.exe",
    "paste.exe",
    "patch.exe",
    "pgrep.exe",
    "pidof.exe",
    "pipe_progress.exe",
    "pkill.exe",
    "printenv.exe",
    "printf.exe",
    "ps.exe",
    "pwd.exe",
    "readlink.exe",
    "realpath.exe",
    "reset.exe",
    "rev.exe",
    "rm.exe",
    "rmdir.exe",
    "rpm.exe",
    "rpm2cpio.exe",
    "sed.exe",
    "seq.exe",
    "sh.exe",
    "sha1sum.exe",
    "sha256sum.exe",
    "sha3sum.exe",
    "sha512sum.exe",
    "shred.exe",
    "shuf.exe",
    "sleep.exe",
    "sort.exe",
    "split.exe",
    "ssl_client.exe",
    "stat.exe",
    "strings.exe",
    "su.exe",
    "sum.exe",
    "sync.exe",
    "tac.exe",
    "tail.exe",
    "tar.exe",
    "tee.exe",
    "test.exe",
    "time.exe",
    "timeout.exe",
    "touch.exe",
    "tr.exe",
    "true.exe",
    "truncate.exe",
    "ts.exe",
    "tsort.exe",
    "ttysize.exe",
    "uname.exe",
    "uncompress.exe",
    "unexpand.exe",
    "uniq.exe",
    "unix2dos.exe",
    "unlink.exe",
    "unlzma.exe",
    "unlzop.exe",
    "unzip.exe",
    "uptime.exe",
    "usleep.exe",
    "uudecode.exe",
    "uuencode.exe",
    "watch.exe",
    "wc.exe",
    "wget.exe",
    "which.exe",
    "whoami.exe",
    "whois.exe",
    "xargs.exe",
    "xxd.exe",
    "yes.exe",
    "zcat.exe"
)

Set-Location $dir

foreach ($item in $arr) {
    if (Test-Path -LiteralPath $item) {
        Remove-Item -Force -LiteralPath $item
    }
    New-Item -ItemType SymbolicLink -Name $item -Target busybox.exe
}


. "$($PSScriptRoot)\download.ps1"

# 改用 busybox-w32
DownloadFile 'https://frippery.org/files/busybox/busybox64.exe' "$dir\busybox.exe"
# DownloadFile 'https://github.com/jftuga/less-Windows/releases/download/less-v608/less.exe' "$dir\less.exe"

Set-Location -
