curl -Lo cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
chmod +xrw cloudflared
./cloudflared tunnel --url localhost:8006
