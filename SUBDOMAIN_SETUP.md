# Subdomain Configuration Guide

This guide explains how to set up subdomains for your apps (occ.codebaseapps.com, keibo.codebaseapps.com, join.keibo.codebaseapps.com) to point to the respective pages in your React application.

## Overview

Your apps are now accessible at:
- **Main site**: codebaseapps.com → `/` (Homepage)
- **OCC App**: occ.codebaseapps.com → `/occ` route
- **Keibo App**: keibo.codebaseapps.com → `/keibo` route
- **Keibo Join**: join.keibo.codebaseapps.com → `/keibo/join` route

## Setup Options

There are several ways to configure subdomain routing depending on your hosting provider.

---

## Option 1: Using a Reverse Proxy (Recommended for Production)

### With Nginx

If you're using Nginx as your web server, add these server blocks to your configuration:

```nginx
# Main domain
server {
    listen 80;
    server_name codebaseapps.com www.codebaseapps.com;
    
    root /var/www/codebaseapps/dist;
    index index.html;
    
    location / {
        try_files $uri $uri/ /index.html;
    }
}

# OCC subdomain
server {
    listen 80;
    server_name occ.codebaseapps.com;
    
    root /var/www/codebaseapps/dist;
    index index.html;
    
    location / {
        try_files $uri /index.html;
        rewrite ^/$ /occ break;
    }
}

# Keibo subdomain
server {
    listen 80;
    server_name keibo.codebaseapps.com;
    
    root /var/www/codebaseapps/dist;
    index index.html;
    
    location / {
        try_files $uri /index.html;
        rewrite ^/$ /keibo break;
    }
}

# Keibo Join subdomain
server {
    listen 80;
    server_name join.keibo.codebaseapps.com;
    
    root /var/www/codebaseapps/dist;
    index index.html;
    
    location / {
        try_files $uri /index.html;
        rewrite ^/$ /keibo/join break;
    }
}
```

### With Apache (.htaccess)

If you're using Apache, create or update your `.htaccess` file:

```apache
<IfModule mod_rewrite.c>
    RewriteEngine On
    RewriteBase /
    
    # Handle subdomain redirects
    RewriteCond %{HTTP_HOST} ^occ\.codebaseapps\.com$ [NC]
    RewriteCond %{REQUEST_URI} ^/$
    RewriteRule ^(.*)$ /occ [L,R=301]
    
    RewriteCond %{HTTP_HOST} ^keibo\.codebaseapps\.com$ [NC]
    RewriteCond %{REQUEST_URI} ^/$
    RewriteRule ^(.*)$ /keibo [L,R=301]
    
    RewriteCond %{HTTP_HOST} ^join\.keibo\.codebaseapps\.com$ [NC]
    RewriteCond %{REQUEST_URI} ^/$
    RewriteRule ^(.*)$ /keibo/join [L,R=301]
    
    # Handle React Router
    RewriteCond %{REQUEST_FILENAME} !-f
    RewriteCond %{REQUEST_FILENAME} !-d
    RewriteRule . /index.html [L]
</IfModule>
```

---

## Option 2: Using Vercel

If you're deploying to Vercel, create a `vercel.json` file in your project root:

```json
{
  "rewrites": [
    {
      "source": "/(.*)",
      "destination": "/index.html",
      "has": [
        {
          "type": "host",
          "value": "occ.codebaseapps.com"
        }
      ]
    },
    {
      "source": "/",
      "destination": "/occ",
      "has": [
        {
          "type": "host",
          "value": "occ.codebaseapps.com"
        }
      ]
    },
    {
      "source": "/(.*)",
      "destination": "/index.html",
      "has": [
        {
          "type": "host",
          "value": "keibo.codebaseapps.com"
        }
      ]
    },
    {
      "source": "/",
      "destination": "/keibo",
      "has": [
        {
          "type": "host",
          "value": "keibo.codebaseapps.com"
        }
      ]
    },
    {
      "source": "/(.*)",
      "destination": "/index.html",
      "has": [
        {
          "type": "host",
          "value": "join.keibo.codebaseapps.com"
        }
      ]
    },
    {
      "source": "/",
      "destination": "/keibo/join",
      "has": [
        {
          "type": "host",
          "value": "join.keibo.codebaseapps.com"
        }
      ]
    }
  ]
}
```

Then in your Vercel dashboard:
1. Go to your project settings
2. Navigate to Domains
3. Add the following domains:
   - `occ.codebaseapps.com`
   - `keibo.codebaseapps.com`
   - `join.keibo.codebaseapps.com`

---

## Option 3: Using Netlify

If you're deploying to Netlify, create a `netlify.toml` file:

```toml
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
  force = false
  conditions = {Host = ["occ.codebaseapps.com"]}

[[redirects]]
  from = "/"
  to = "/occ"
  status = 301
  force = true
  conditions = {Host = ["occ.codebaseapps.com"]}

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
  force = false
  conditions = {Host = ["keibo.codebaseapps.com"]}

[[redirects]]
  from = "/"
  to = "/keibo"
  status = 301
  force = true
  conditions = {Host = ["keibo.codebaseapps.com"]}

[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
  force = false
  conditions = {Host = ["join.keibo.codebaseapps.com"]}

[[redirects]]
  from = "/"
  to = "/keibo/join"
  status = 301
  force = true
  conditions = {Host = ["join.keibo.codebaseapps.com"]}

# Fallback for SPA routing
[[redirects]]
  from = "/*"
  to = "/index.html"
  status = 200
```

Then in your Netlify dashboard:
1. Go to Site Settings → Domain Management
2. Add the subdomains as custom domains
3. Configure DNS accordingly

---

## Option 4: Using AWS CloudFront

For AWS CloudFront distribution:

1. Create a CloudFront distribution for your S3 bucket or origin
2. Add alternate domain names (CNAMEs):
   - `occ.codebaseapps.com`
   - `keibo.codebaseapps.com`
   - `join.keibo.codebaseapps.com`
3. Create Lambda@Edge function for routing:

```javascript
exports.handler = async (event) => {
    const request = event.Records[0].cf.request;
    const host = request.headers.host[0].value;
    
    if (host === 'occ.codebaseapps.com' && request.uri === '/') {
        request.uri = '/occ';
    } else if (host === 'keibo.codebaseapps.com' && request.uri === '/') {
        request.uri = '/keibo';
    } else if (host === 'join.keibo.codebaseapps.com' && request.uri === '/') {
        request.uri = '/keibo/join';
    }
    
    // Fallback to index.html for SPA
    if (!request.uri.includes('.')) {
        request.uri = '/index.html';
    }
    
    return request;
};
```

---

## DNS Configuration

Regardless of the hosting option, you need to configure DNS records:

### Using A Records (if you have a static IP):
```
Type    Name    Value               TTL
A       occ     <your-server-ip>    3600
A       keibo   <your-server-ip>    3600
A       join    <your-server-ip>    3600  (this is a subdomain of keibo)
```

### Using CNAME Records (if you're using a hosting provider):
```
Type    Name    Value                           TTL
CNAME   occ     <your-hosting-domain>           3600
CNAME   keibo   <your-hosting-domain>           3600
CNAME   join    <your-hosting-domain>           3600
```

**Note**: For `join.keibo.codebaseapps.com`, you typically need to create a CNAME for `join.keibo` or set up proper subdomain delegation.

---

## Alternative: Client-Side Detection (Quick Solution)

If you can't configure server-side routing immediately, you can add client-side detection:

Create a new file `src/utils/subdomainRedirect.ts`:

```typescript
export const handleSubdomainRedirect = () => {
  const hostname = window.location.hostname;
  const path = window.location.pathname;
  
  // Only redirect if we're at the root
  if (path === '/' || path === '') {
    if (hostname === 'occ.codebaseapps.com') {
      window.location.href = '/occ';
    } else if (hostname === 'keibo.codebaseapps.com') {
      window.location.href = '/keibo';
    } else if (hostname === 'join.keibo.codebaseapps.com') {
      window.location.href = '/keibo/join';
    }
  }
};
```

Then update `src/main.tsx`:

```typescript
import { handleSubdomainRedirect } from './utils/subdomainRedirect';

// Add this before rendering
handleSubdomainRedirect();

ReactDOM.createRoot(document.getElementById("root")!).render(
  <React.StrictMode>
    <App />
  </React.StrictMode>
);
```

---

## Testing Locally

To test subdomain routing locally, add entries to your hosts file:

### On macOS/Linux:
```bash
sudo nano /etc/hosts
```

Add these lines:
```
127.0.0.1   occ.codebaseapps.local
127.0.0.1   keibo.codebaseapps.local
127.0.0.1   join.keibo.codebaseapps.local
```

### On Windows:
Edit `C:\Windows\System32\drivers\etc\hosts` and add:
```
127.0.0.1   occ.codebaseapps.local
127.0.0.1   keibo.codebaseapps.local
127.0.0.1   join.keibo.codebaseapps.local
```

Then access:
- http://occ.codebaseapps.local:8080
- http://keibo.codebaseapps.local:8080
- http://join.keibo.codebaseapps.local:8080

---

## SSL/TLS Configuration

Don't forget to secure your subdomains with SSL certificates:

### Using Let's Encrypt (Certbot):
```bash
sudo certbot --nginx -d occ.codebaseapps.com -d keibo.codebaseapps.com -d join.keibo.codebaseapps.com
```

### Using Cloudflare:
If you use Cloudflare, SSL is automatically handled for subdomains.

---

## Troubleshooting

### Issue: Subdomain not working
1. Check DNS propagation: https://www.whatsmydns.net/
2. Clear browser cache and DNS cache
3. Verify server configuration is correct
4. Check that React Router is handling routes properly

### Issue: 404 on page refresh
- Ensure your server is configured to serve `index.html` for all routes
- Check that the `try_files` or rewrite rules are correct

### Issue: join.keibo.codebaseapps.com not resolving
- Multi-level subdomains need proper DNS configuration
- Some DNS providers require specific configuration for sub-subdomains
- Consider using `join-keibo.codebaseapps.com` as an alternative if issues persist

---

## Current Routes

Your application now supports these routes:

| Route | Component | Description |
|-------|-----------|-------------|
| `/` | Index | Homepage |
| `/about` | About | About page |
| `/occ` | OCC | OCC app landing page |
| `/keibo` | Keibo | Keibo app landing page |
| `/keibo/join` | KeiboJoin | Keibo signup page |

These routes work seamlessly with subdomain configuration!
