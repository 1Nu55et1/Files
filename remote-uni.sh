# Check if cloudflared exists
if [ ! -f "cloudflared" ]; then
    # Download cloudflared based on architecture
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

# Ask user to confirm before proceeding
echo "=========================================================================================================================="
echo "WARNING: Cloudflare Tunnel!"
echo "=========================================================================================================================="
echo "This script will create a new Cloudflare Tunnel for your SillyTavern instance."
echo "The tunnel will be accessible at <https://your-tunnel-subdomain.trycloudflare.com>"
echo ""
echo "Please make sure that you have configured your DNS settings correctly and that your domain name resolves to your server's IP address."
echo ""
echo "By continuing, you confirm that you understand the risks associated with creating a publicly accessible tunnel and agree to use it responsibly."
echo ""
read -p "Press enter to continue or Ctrl+C to cancel"

# Create a new tunnel using cloudflared
./cloudflared tunnel --url localhost:8000
