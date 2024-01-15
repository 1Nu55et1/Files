if [ ! -f "cloudflared" ]; then
    ARCH=$(uname -m)
    case $ARCH in
        x86_64)
            curl -Lo cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64
            ;;
        i686)
            curl -Lo cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-386
            ;;
        armv7l)
            curl -Lo cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm
            ;;
        aarch64)
            curl -Lo cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-arm64
            ;;
        *)
            echo "Architecture not supported: $ARCH"
            exit 1
            ;;
    esac
    chmod +x cloudflared
fi

sudo ./ArchipelagoLauncher & ./cloudflared tunnel --url localhost:38281
