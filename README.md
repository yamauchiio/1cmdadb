# 1cmdadb

### Windows

```
Start-Process -FilePath "powershell" -ArgumentList "Invoke-Expression (Invoke-WebRequest -Uri 'https://github.com/yamauchiio/1cmdadb/raw/main/1cmdadb_windows.ps1').Content" -Verb RunAs
```

### Mac

```
/bin/bash -c "$(curl https://raw.githubusercontent.com/yamauchiio/1cmdadb/main/1cmdadb_darwin.sh)"
```

### Linux

```
sudo /bin/bash -c "$(curl https://raw.githubusercontent.com/yamauchiio/1cmdadb/main/1cmdadb_linux.sh)"
```

Paste that in a Windows Terminal or macOS Terminal or Linux Shell Prompt.
